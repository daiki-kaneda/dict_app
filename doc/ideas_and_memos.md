# メモ

### 2025-1-02
1-02の内容は、dict_app_baseに移動

### 2025-1-08
#### リリースについて
このアプリをリリースすると、STTのコストの高さから、ユーザの利用をサブスクリプション前提のものにしてしまう。
しかし、アプリの特徴から、音声とスクリプトを予めアセットにいれさえすれば、ほぼノーコストで同じような体験をユーザに提供できる。これに付加価値を加える形でユーザにサブスクリプションを求める形式の方が、ユーザの満足度と収益を高めるのではないだろうか。そもそも自前の英語の音声を用意するのもUXを損ねる可能性があると言う点も考慮したい。
これより、別のプロジェクトで上に述べたようなアプリのプロトタイプを作ってみたい.
具体的には、アプリ開始時のデフォルトのDataTreeを、dict_appを使って作った特定のオーディオブックのFolderにして、audioPathをそれぞれ適切にAssetに用意した音声にする。
##### 原則に基づこう
ETC原則やOpen closed原則に基づいて、変更、拡張しやすくするために、予めアセットに入れるjsonが表すモデルはincludeIfNullの形式でjson化しよう。
新しいpropertyを追加したい場合は、
- nullableなプロパティとして追加し、
既存のpropertyを修正したい場合は、
- 新しいpropertyを追加して、既存のものの役割を、新しいものに置き換える
ようにすればいい。

### 2025-1-09
#### UIについて
- Transformウィジェットなどを使って、ページを捲るアニメーションなどができるかもしれない.

#### 1-08の「リリースについて」の追記
local_dict_protoというプロジェクトを作って、上の「リリースについて」で書いたようなプロトタイプの実装ができた。

##### 次のステップ
ETC原則,DRY原則に基づいて、プロトタイプのアプリのアセット以外の機能を持つパッケージdict_app_baseを作る。
大きなパッケージになるので、もし、その部分で再利用したいところができたら、dict_app_base内で分割すればいい。

**追記**:dict_app_baseパッケージを作成した。
一旦,dict_appアプリは音声のjsonデータ共有アプリとして活用したい。もっと簡素化して、フォルダ構造のある文字起こしアプリの雛形として開発してもいいかも。
また、dictation関係のUIの操作についてのTODOはdict_app_baseに移動する。

### 2025-2-05
#### 操作性の改善
- [x] ダークモード対応したい
  - CupertinoDynamicColor.resolveFromが使えるかも
- [ ] 次のセンテンスやパラグラフに進むのをもっと簡単にするべき。例えばナビゲーションバーのtrailing にボタンをつけるなど
  - アクションシートに付け加える
- [ ] 音声を再生中にタイプし始めたら音声を止めるかどうかを設定できるようにする
  - アクションシートから設定シートを開けるようにする
- [ ] ヘルプをつけるといいかも 
  - アクションシートからヘルプシートを開けるようにする
- [ ] 新規ディクテーション、新規フォルダが重複する場合は番号を振るうべきかも
  - これは保留
- [ ] 1文字目の入力がうまくいかないことが多いので改善したい
  - tryCharacterのロジックを確認.ref.listenなど
- [ ] 1単語の入力が完了したら、自動的に次の単語の入力に移行するようにすべき
  - もしそれが最後の単語であれば、次に進むかを確認するダイアログを表示するといいかも
- [ ] 各パラグラフ、センテンス、ワードのタイルを長押ししてアクションシートを出せるようにしたい
  - それによって、詳細データの表示などをできるようにする
- [ ] AIの解説シートがあれば便利(広告とfirebaseStorageを使わずに、この利用のサブスクでもいいかもしれない)
  - 画面内に移動可能かつタップ可能なアイコンを表示して、それをタップするとAIのヒントとなるシートを表示するといいかもしれない。チャットでもいいかも
  - [ ] ページを捲るアニメーションなども付け加えるとユーザは快適かも
- [x] スペースでワードを区切っているので、スペースでワードの選択を移動したい
- [ ] SentencesはPageViewで表した方がいいかもしれない(プレイヤーのロジックに気をつけたい)
- [ ] まだ解けていない初めのワードにautofocusすべき
- [x] リストタイルなどに完了済み、未完了を表示すべし
  - [ ] 完了している割合なども表せるようにしたい

#### Refactorメモ
- MaterialAppのcupertinoOverrideThemeを利用して、アダプティブかつダークモード対応する
- persistedFooterButtonは公式の実装を参考にして、手動で追加する方がいいかもしれない

### 2025-2-06
#### メモ
- MaterialAppのcupertinoOverrideThemeを修正して、ダークモード対応した
- DictationWordのtryCharacterにはindexに当たる文字の存在をチェックするガードが欠けているかもしれない

#### ロジックの修正
- navigatorObserverを使用する（popのボタンにプレイヤーの停止のロジックを含めない。スライドでpopした場合などを想定）
- 同様にウィジェットに依存せず、paragraphIndex,sentenceIndex,wordIndexをリッスンして、必要な処理を自動で行うようにする

### 2025-2-07
#### NavigatorObserver + ProviderRef
ProviderRefを持つNavigatorObserverを提供する同期的なproviderを定義して、Navigatorに渡したい.
以下の機能を持つようにしたい
- DictProblemViewからpopする際に、playerを停止
- DictViewへpushする際に、対応するオーディオをplayerにセット
- showingDictViewなども同様に手動ではなくNavigatorObserverによって、更新したい

### 2025-3-05
次の二つを導入して、クリーンかつ高速に実行するコードを書きたい
- [x] go_router(キーワード：ShellRoute,pathParameters)
- [x] Isar(キーワード: parentIdを持たせることによるフォルダ構造)

### 2025-3-08

#### オーディオの設定のロジックまとめ
1. fileを開くリストタイルのonTapで、fileのaudioPathの音声をset
2. PageControllerのpageの変更をリッスンして、次のページのsentenceに対応するstart,endを設定する

#### ディクテーション問題に関するロジックまとめ
1. focusNode,Future.delayedなどを使って、DictationPageが表示されるときに、キーボードを表示
2. ユーザがキーボードを打つ
3. fileIdはpathから、sentenceIndexはcurrentSentenceIndexから、wordIndexはcurrentWordIndexから取得して、キーボードで打たれた文字が正解かどうかを確かめ、正解の場合は、その文字をtrueに変更,不正解の場合は、BackDropFilterなどを使って、不正解のエフェクトを表示

#### アプリの運用について
まずは、アプリの質を向上させていきたい。それがなければ、収益化など考える資格もないだろう。
しかし、基本的なアイデアとしては、アプリの運用のために、消耗型の課金システムを導入したい。
理由は、次の三つの理由でアプリのユーザ体験を向上させると思うからだ
- 必要な分だけを購入できる
- 30分:50円でも利益が出るので、安価で提供できる
- 広告がない

#### path_providerで取得できるディレクトリ
path_providerで取得できる主なディレクトリ
- Temporary:一時的なデータを格納するディレクトリ
- Application Support:ユーザが直接アクセスできないデータを格納するディレクトリ
- Application Documents:ユーザが直接アクセスできるデータを格納するディレクトリ
音声やIsarのデータをSupportではなく、Documentsに保存してしまっていたので、修正したい。ユーザがアクセスできるDocumentsには、音声解析のデータ(pdfなど)を自動的に格納できるようにしたい。

### 2025-3-10
#### providerの生存範囲
ディクテーション関連のproviderで生存範囲を整理したい。

**アプリ全体で生きるprovider**
- isarProvider
- audioPlayerNotifierProvider
- playerStateProvider
- playerPositionProvider
- playerStateProvider
- playerDurationProvider
- startEndProviderProvider

**FileDetailsView内で初期化され、FileDetailsView内のみ生きるprovider**
- fileProvider(id)
- currentSentenceIndexInAllSentencesProvider
- sentencePageControllerProvider
- currentWordIndexProvider

#### DRY原則によるfileIdの一元化
pathPrametersでfileIdを扱うという点で,さらに現在開いているFileのidをproviderなどでトラックすることは、DRY原則に反するので、それはしない。
FileDetailsViewが受け取るidはGoRouterのpathParamerからのものなので、完全に現在参照しているファイルIdと一致する。したがって、そのidを
- currentSentenceIndexInAllSentencesProvider
- sentencePageControllerProvider
- currentWordIndexProvider
が引数として受け取って使うことは、これらの内部で、pathParameterを参照することと同じことなので、そのようにすることはDRY原則に反しない。

上のような,特定のページ内でのみ存在が許されるproviderに,そのページのid(pathparameterから取得される)を引数として渡すという構造は、providerの処理にidが必要な場合に非常に便利だ。(もちろん、providerはauto-disposeにする)