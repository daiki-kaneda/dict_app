# クラウド移行 実装計画

目的:ローカルに閉じたディクテーションアプリを、AWS ベースのスケーラブルなサーバーレス構成に移行する。
決定事項の詳細は `doc/adr/0001-cloud-architecture.md`、API 契約は `api/openapi.yaml` を参照。

## 1. 確定した方針

| # | 項目 | 決定 |
|---|---|---|
| 1 | Lambda の言語 | TypeScript |
| 2 | オフライン | オフラインファースト。進捗はセンテンス単位のビットマップ + 集計カウンタで管理 |
| 3 | 公開問題 | 公開問題は未ログインでも利用可能。ユーザーによる公開は後続フェーズ(モデレーション前提) |
| 4 | 既存ユーザー | いない前提。データ移行フロー、Isar マイグレーションは作らない |
| 5 | 課金 | サブスクのみ。消耗型チケットは廃止 |
| 6 | 翻訳 | アップロード完了後に自動実行。Amazon Bedrock の Claude Haiku を使用(Gemini は廃止) |
| 7 | ログ | 日次集計のみ同期。生ログはローカルのみ |
| 8 | アカウント削除 | アプリ内から削除可能にし、DynamoDB / S3 / Cognito を連鎖削除 |

## 2. アーキテクチャ

```
Flutter ─(Cognito OAuth/PKCE)→ Cognito User Pool
   │
   ├─ HTTPS + JWT ─→ API Gateway (HTTP API, JWT authorizer) ─→ Lambda (API handlers)
   │                                                              ├─ DynamoDB (single table)
   │                                                              └─ S3 presigned POST を発行
   ├─ presigned POST ─→ S3 (uploads/)   ※サイズ上限は content-length-range 条件で強制
   │                       │ ObjectCreated
   │                       ▼
   │                  SQS (+DLQ) ─→ Lambda "process-audio"
   │                                   ├─ 音声ヘッダから再生時間を検証(STT 前)
   │                                   ├─ SpeechToTextPort (Deepgram adapter)
   │                                   ├─ SentenceSegmenter (ドメインロジック)
   │                                   ├─ content.json → S3 / メタデータ → DynamoDB
   │                                   └─ 翻訳ジョブ → SQS → Lambda "translate" (TranslationPort / Bedrock Haiku)
   │
   └─ 音声・content.json・translations → CloudFront (OAC) → S3
        ├─ private/  : 署名付き URL/Cookie
        └─ public/   : 署名不要(キャッシュ最大化)
```

### 2.1 DynamoDB(シングルテーブル)

| PK | SK | 内容 |
|---|---|---|
| `USER#<sub>` | `PROFILE` | plan、設定、翻訳先言語 |
| `USER#<sub>` | `USAGE#YYYY-MM` | 月次の推論回数・累積秒数(条件付き ADD) |
| `USER#<sub>` | `ITEM#<itemId>` | フォルダ / ファイル / 公開問題への参照。`parentId`、status、duration、S3 キー、`schemaVersion`、`sttProvider/sttModel`。GSI1 で `parentId` 別一覧 |
| `USER#<sub>` | `PROGRESS#<fileId>` | 進捗(§4) |
| `USER#<sub>` | `STATS#YYYY-MM-DD` | 日次学習統計 |
| `PUBLIC#ITEM` | `<publishedAt>#<itemId>` | 公開問題の一覧(GSI または Query 用) |
| `PUBLIC#<itemId>` | `META` | 公開問題の実体メタデータ(所有者、content の S3 キー、利用数) |

### 2.2 公開問題

- 公開問題の content / 音声は `public/` プレフィックスに置き、全ユーザーで共有する。STT・翻訳コストは作成時の1回のみで、利用者は追加コストなしで学習できる。
- ユーザーのライブラリには `ITEM#` として**参照**(`sourcePublicItemId`)を持たせ、進捗はユーザーごとに `PROGRESS#` で管理する。
- 公開問題の閲覧・学習は未ログインで可能(`/public/*` は認可なし)。進捗はローカルのみに保存し、ログイン後に同期する。
- 翻訳は言語ごとに `translations/<lang>.json` を共有キャッシュとして持つ。未翻訳の言語が要求されたときだけ Bedrock Haiku を呼ぶ(冪等性のため条件付き書き込みで二重実行を防ぐ)。
- 当初は運営が公開する問題のみとする。ユーザーによる公開(`POST /files/{id}/publish`)は、通報機能・削除フロー・利用規約を用意してから有効化する(音源の権利問題があるため)。

### 2.3 プランとクォータ

- `PlanPolicy { maxAudioBytes, maxAudioSeconds, monthlyInferenceLimit, monthlyAudioSeconds }` を SSM Parameter Store か AppConfig に置き、しきい値は再デプロイなしで調整する。
- プランは RevenueCat の entitlement を正とし、webhook → Lambda で `PROFILE.plan` を更新する。クライアントの `consumeTickets` / `remainingTickets` は廃止する。
- `POST /uploads` でプラン確認 → 月次クォータを条件付き `UpdateItem` で予約 → presigned POST を返す。処理失敗時は予約を返却する。
- 申告値は信用しない。サイズは presigned POST の条件で強制し、再生時間は Deepgram に送る前に S3 の Range GET でヘッダを読んで検証する。
- Free プランでも公開問題は無制限に学習できる。STT を伴うアップロードのみ制限する。

### 2.4 翻訳(Bedrock Haiku)

- `TranslationPort` の adapter として `BedrockHaikuTranslator` を実装する(Converse API。構造化出力は tool use で強制)。モデル ID はパラメータストアで切り替える。
- 実行トリガは `process-audio` 完了後の SQS メッセージ。入力は文の配列、出力は同じ長さの翻訳配列。長さが一致しない場合は再試行し、DLQ に送る。
- リージョンとモデルの利用可否(クロスリージョン推論プロファイル含む)は、フェーズ2で dev アカウントで確認する。

## 3. クリーンアーキテクチャ

### 3.1 Flutter

```
lib/
  core/              # Failure/Result、Clock、Logger
  features/
    library/ dictation/ auth/ plan/ settings/ stats/ print/ player/
      domain/        # entities, repositories(abstract), usecases(Flutter/Isar/Dio に非依存)
      data/          # datasources(remote: API / local: Isar), repository impl, DTO + mapper
      presentation/  # widgets, Riverpod notifiers(状態のみ。ダイアログ等の副作用は UI 層)
```

- `@embedded` / `@collection` / `@JsonSerializable` は data 層の DTO に隔離し、domain は純粋な Dart クラスにする。
- Isar はオフラインファーストのローカル DB として残す。読み取りは「ローカル表示 → バックグラウンド同期」。書き込みはローカルを正としてキューに積み、debounce して同期する。
- `tryCharacter` 等の正誤判定はクライアントのドメイン層に残す(打鍵ごとの低レイテンシとアニメーションのため)。

### 3.2 STT の置き換え可能性

```
domain:   SpeechToTextPort.transcribe(AudioRef, TranscribeOptions) → Transcript
          Transcript = { words:[{text, punctuated, start, end, confidence}], duration, language, providerMeta }
          SentenceSegmenter(Transcript) → paragraphs / sentences   // プロバイダ非依存
adapter:  DeepgramTranscriber (nova-2)  /  将来: AwsTranscribe, Whisper, AssemblyAI ...
```

アダプタは単語列とタイムスタンプを返すだけにし、文・段落の分割はドメイン側の `SentenceSegmenter` が行う。プロバイダ差し替え時の影響をアダプタに閉じ込める。

### 3.3 バックエンド

```
backend/src/
  domain/      # entities, PlanPolicy, ports (SpeechToTextPort, TranslationPort, ItemRepository, ObjectStorage, ...)
  usecases/    # RequestUpload, ProcessUploadedAudio, ListLibrary, GetFile, SyncProgress, ...
  adapters/    # dynamodb, s3, deepgram, bedrock, ssm, revenuecat
  handlers/    # api (API Gateway), process-audio (SQS), translate (SQS), webhook
```

Lambda ハンドラは入出力の変換だけを行い、ロジックはユースケースに置く。

## 4. 進捗(Progress)とオフライン同期

### 4.1 Content と Progress の分離

- **Content**(サーバー生成・不変): 段落 → 文 → 文テキスト、時間(start/end)。文字・単語オブジェクトは保存せず、クライアントが `sentence.text.split(' ')` から導出する。現状の `File.words`(`WordData`)は UI で使われていないため、content には含めない。
- **Progress**(ユーザー生成・可変): センテンスごとのビットマップ + 集計カウンタ。

### 4.2 Progress の形式

文ごとに、**アルファベット文字(`DictationCharacter.isAlphabet` が真の文字)に出現順で 0..n-1 の番号を振り、解答済みの文字を 1 とするビットマップ**を持つ。

```json
{
  "fileId": "...",
  "contentVersion": 1,
  "schemaVersion": 1,
  "completedCount": 0,
  "sentences": [
    { "bits": "<base64>", "attempts": 12, "solvedWithoutHint": 9, "hintSolved": 2, "epoch": 0 }
  ],
  "updatedAt": "2026-10-07T00:00:00Z"
}
```

- 150 文字の文で約 19 バイト。100 文のファイルでも数 KB で、DynamoDB の 400KB 制限に対して十分余裕がある。
- 単語・文・段落の完了は、ビットマップと content から導出する(保存しない)。現在の `isCompleted` / `completionRate` / `accuracy()` に相当する値もここから計算する。
- `accuracy()` は文ごとのカウンタの合計から求める。文字単位の attempts までは保持しない(必要になったら拡張)。
- 同期のマージ規則:
  - ビットマップは OR(単調増加)。
  - カウンタは `max`。ただし端末ごとの加算が必要になる場合は端末別カウンタに拡張する。
  - 「やり直し(reset)」は文の `epoch` をインクリメントし、`epoch` が大きい側を採用する。同じ `epoch` では OR / `max`。
- `PUT /files/{fileId}/progress` はマージ結果を返し、クライアントはそれをローカルに反映する。

### 4.3 日次統計

`LogEntry`(1 打鍵 1 レコード)はローカルに残し、日付ごとに集計した値(試行数、成功数、ヒント数、学習時間)のみ `PUT /stats/daily` で同期する。

## 5. インフラ(Terraform)

- `infra/modules`、`infra/envs/dev`、`infra/envs/prod`。State は S3(ロック付き)で環境別。
- 公式モジュール(terraform-aws-modules)を使うもの: `s3-bucket`、`cloudfront`、`dynamodb-table`、`lambda`、`apigateway-v2`、`sqs`、`iam`、`kms`、`cloudwatch`、`sns`。Cognito User Pool の公式モジュールは見当たらないため、`aws_cognito_*` の薄い自前モジュールにする(着手時に最新状況を再確認)。
- CloudFront は OAC。private は署名付き URL/Cookie(署名鍵は Secrets Manager)、public は署名不要。
- シークレット(Deepgram、RevenueCat webhook)は Secrets Manager。Bedrock は IAM(`bedrock:InvokeModel` / `Converse`)のみ。
- 運用: DynamoDB PITR、S3 ライフサイクル(`uploads/` の一時領域)、DLQ・エラー率・duration のアラーム、AWS Budgets、API のスロットリング。

## 6. CI/CD(GitHub Actions)

AWS 認証は OIDC(長期キーなし)。

- **infra**: PR で `fmt` / `validate` / `tflint` / `trivy` / `terraform plan`(PR にコメント)。main マージで dev に apply、prod は Environment 承認後。
- **backend**: lint、型チェック、ユニットテスト、OpenAPI コントラクトテスト、esbuild、dev へデプロイ(artifact を S3 に置き `update-function-code` + version + alias)、スモークテスト、prod へ昇格。Terraform は関数設定を管理し、コードは `ignore_changes`。
- **Flutter**: `flutter analyze`、`flutter test`、build_runner 生成物の差分チェック、OpenAPI 生成クライアントの差分チェック。
- `paths` フィルタで変更箇所別に実行。リポジトリは Flutter をルートに残し、`backend/`、`infra/`、`api/` を追加する。

## 7. 実装フェーズ

各フェーズは単体でマージ可能にする。

### フェーズ0: 土台と合意(本ブランチ)
- [x] 決定事項の ADR 化(`doc/adr/0001-cloud-architecture.md`)
- [x] OpenAPI 初版(`api/openapi.yaml`)
- [ ] Deepgram / Gemini キーのローテーション(アプリバンドルに同梱されていたため漏洩扱い)
- [ ] AWS アカウント構成(dev / prod)と命名規則の決定

### フェーズ1: クライアントのクリーンアーキ化(クラウドなし、挙動不変)
- 特性テストの追加: `tryCharacter` / `reset` 系、固定の Deepgram レスポンス JSON → `DictationSection` 変換のゴールデンテスト(Lambda 移植の正解データになる)。
- `test/model_provider_test.dart` など外部 API 依存テストの修正。
- domain / data / presentation への分割。Isar・JSON アノテーションを DTO に隔離。リポジトリ抽象 + Isar 実装。Notifier から UI 副作用(`showNotifyDialog`、`navigatorKey`)を排除。
- Content / Progress の分離とビットマップ進捗の導入(既存ユーザーがいないため、Isar のマイグレーションは不要。スキーマを直接置き換える)。
- チケット(`remainingTickets`、`ProductStatus`)の撤去準備。

### フェーズ2: インフラ基盤(dev)
- Terraform の State、OIDC、CI。
- Cognito、DynamoDB、S3、CloudFront(OAC)、API Gateway(ヘルスチェック)。
- Bedrock の利用可能リージョン / モデルを確認。

### フェーズ3: バックエンド コア API
- JWT 認証つきの `/me`、`/library`、PlanPolicy、`/uploads`(クォータ予約つき presigned POST)、`/public/*`。
- ユニットテストと OpenAPI コントラクトテスト、DynamoDB Local での結合テスト。

### フェーズ4: 非同期処理パイプライン
- S3 → SQS → `process-audio`(再生時間の事前検証、Deepgram adapter、`SentenceSegmenter`、S3 / DynamoDB 保存、失敗時のクォータ返却、DLQ)。
- フェーズ1のゴールデン fixture と Lambda の出力が一致することを検証。
- `translate` Lambda(Bedrock Haiku)。
- 運営による公開問題の登録手順(管理用スクリプト)。

### フェーズ5: クライアント統合
- Cognito 認証(`AuthRepository`)。未ログインでも公開問題は利用可能。
- リモートリポジトリ実装、アップロード → ステータスのポーリング UX、進捗同期(debounce、バッチ、§4.2 のマージ)。
- Deepgram 直叩き(`ApiRepository`)、Gemini 直叩き(`ModelRepository`)、`TranscriptModel`、`.env` のキー、`google_generative_ai` 依存を削除。

### フェーズ6: サブスクリプション
- RevenueCat の `appUserID` を Cognito の `sub` に紐付け。webhook → Lambda → `PROFILE.plan` 更新。
- 消耗型チケット(`ticket_5/10/30`、ストア UI、`consumeTickets`)を撤去し、使用量表示と Free / Premium の差分 UI に置き換え。
- Deepgram / Bedrock の単価からユーザー単位の原価を算出し、しきい値(音声サイズ上限、月次推論回数)を調整。

### フェーズ7: 運用強化とユーザー公開
- アラーム、Budgets、WAF / スロットリング、PITR、アカウント削除フロー、負荷試験、prod 昇格手順。
- ユーザーによる問題公開(通報、削除、利用規約、モデレーション)。

## 8. リスクと未決事項

- **Bedrock のリージョンとモデル**: 東京リージョンでの Haiku 利用可否、クロスリージョン推論の要否、料金。フェーズ2で確認。
- **ユーザー公開コンテンツの権利**: 音源の著作権。運営公開のみで開始し、ユーザー公開は法務面の整理後に有効化。
- **Free プランの範囲**: 月次 STT 回数と音声サイズの上限は、フェーズ6で原価から決定(SSM で調整可能にしておく)。
- **進捗カウンタの粒度**: 現在は文単位の集計のみ。文字単位の統計が必要になった場合に拡張する。
- **Apple ログイン**: 他の SNS ログインを併用する場合、App Store の要件を確認する。
