# ADR 0001: クラウド構成と主要な設計判断

- ステータス: 承認済み
- 日付: 2026-10-07

## コンテキスト

ローカルに閉じたディクテーションアプリ(Flutter + Isar、STT は Deepgram 直叩き、翻訳は Gemini 直叩き)を、AWS のサーバーレス構成に移行する。API キーがアプリバンドルに同梱されていること、クォータがクライアントで管理されていること、解析結果の変換ロジックがクライアントにあることが課題である。

## 決定

1. **構成**: Cognito、API Gateway(HTTP API)+ Lambda、DynamoDB(シングルテーブル)、S3 + CloudFront。音声解析は S3 イベント → SQS → Lambda で非同期に行う。
2. **Lambda の言語**: TypeScript。
3. **オフラインファースト**: Isar をローカルの正とし、バックグラウンドで同期する。進捗はセンテンス単位のビットマップ + 集計カウンタ。マージは OR / `max`、やり直しは `epoch` で解決する。
4. **Content と Progress の分離**: 内容(サーバー生成・不変)は S3 の JSON、進捗(ユーザー生成・可変)は DynamoDB に置く。文字・単語のオブジェクトは保存せず、クライアントがテキストから導出する。
5. **公開問題**: 未ログインでも利用可能。共有 content を参照し、進捗はユーザーごとに持つ。ユーザーによる公開は後続フェーズ。
6. **既存ユーザーなし**: 移行フロー、Isar マイグレーションは作らない。
7. **課金はサブスクのみ**: 消耗型チケットは廃止。プランは RevenueCat の entitlement を正とし、webhook でサーバーに反映する。クォータはサーバー側で強制する。
8. **STT の抽象化**: `SpeechToTextPort` + Deepgram adapter。adapter は単語列とタイムスタンプのみを返し、文・段落の分割はドメインの `SentenceSegmenter` が行う。
9. **翻訳**: アップロード完了後に自動実行。`TranslationPort` + Bedrock の Claude Haiku adapter。Gemini は廃止する。
10. **ログ**: 日次集計のみ同期する。
11. **アカウント削除**: アプリ内から実行でき、DynamoDB / S3 / Cognito を連鎖削除する。
12. **IaC / CI/CD**: Terraform(公式モジュール優先、Cognito は自前の薄いモジュール)と GitHub Actions(OIDC)。infra と app でワークフローを分ける。

## 根拠

- **クライアントに残すもの**: 正誤判定(`tryCharacter`)は打鍵ごとの低レイテンシとアニメーションのためクライアントに残す。サーバーに移すのは STT 呼び出し、構造化変換、翻訳、クォータ・プラン判定。
- **S3 → SQS → Lambda**: 再試行、DLQ、同時実行制御ができる。STT の二重課金リスクを減らせる。
- **解析結果を S3 に置く**: DynamoDB の 400KB 上限を避け、CloudFront でキャッシュできる。
- **ビットマップ進捗**: 150 文字の文で約 19 バイト。文字単位の状態を保持しつつ、同期ペイロードを小さくできる。単調増加なのでマージが単純になる。
- **公開問題の共有**: STT / 翻訳コストを作成時 1 回にでき、Free プランでも学習体験を提供できる。
- **再生時間の事前検証**: STT の課金前に弾くため、S3 の Range GET で音声ヘッダを読む。

## 影響

- 既存の `ApiRepository`、`ModelRepository`、`TranscriptModel`、`.env` のキー、`google_generative_ai` 依存は最終的に削除する。
- `Setting.remainingTickets`、`ProductStatus`、チケット購入 UI は廃止する。
- Deepgram と Gemini のキーは漏洩扱いとしてローテーションする。
- Cognito の公式 Terraform モジュールがないため、自前モジュールを保守する。
- ユーザー公開コンテンツの権利・モデレーションは、運営公開のみで開始し、整理後に有効化する。
