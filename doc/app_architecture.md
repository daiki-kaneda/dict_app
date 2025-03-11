# アプリの構造
目的：目標のアプリのビジネスロジックとルート構造を図でまとめる

## ルート構造
- Home()(isar_provider)
  - SubItemsView(parentId)(subItemsProvider(parentId))
    - SubItemsView(parentId)(subItemsProvider(parentId))
      - SubItemsView(parentId)(subItemsProvider(parentId))
        - ... 
          - FileDetailsView(fileId)(fileProvider(fileId),currentSentenceIndexInAllSentencesProvider(fileId),sentencePageControllerProvider(fileId),currentWordIndexProvider(fileId))
            - DictationView(fileId)
              - DictationSheet(fileId)
            - ListeningView(fileId)
            <!-- - WordsView(fileId)
            - SettingView(fileId) -->

## provider構造
**Home以下で生きるprovider**
- isar_provider
**SubItemsView(parentId)以下で生きるprovider**
- subItemsProvider(parentId)
**FileDetailsView以下で生きるprovider**
- fileProvider(fileId),
**DictationView以下で生きるprovider**
- currentSentenceIndexInAllSentencesProvider(fileId),
- sentencePageControllerProvider(fileId),
- currentWordIndexProvider(fileId)
- audioPlayer関連のprovider
  - audioPlayerNotifierProvider
  - playerStateProvider
  - playerPositionProvider
  - playerDurationProvider
  - startEndProviderProvider
 