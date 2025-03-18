import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/dictation_page_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/input_text_field.dart';
import 'package:dict_app/isar_widgets/file_details_view/progress_indicator.dart';
import 'package:dict_app/isar_widgets/utils/platform_linear_indicator.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_widget.dart';
import 'package:dict_app/isar_widgets/utils/close_button.dart';
import 'package:dict_app/isar_widgets/utils/platform_dialog.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DictationView extends ConsumerWidget {
  const DictationView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(fileNotifierProvider(fileId));
    ref.watch(audioPlayerNotifierProvider);
    ref.watch(playerStateProvider);
    ref.watch(playerPositionProvider);
    ref.watch(playerStateProvider);
    ref.watch(playerDurationProvider);
    ref.watch(startEndProviderProvider);

    void initDict({int startSentenceIndex=0}) {
      if (file == null) return;
      // - set audio path to AudioPlayer
      final audioPath = file.audioPath;
      ref.read(audioPlayerNotifierProvider.notifier).setSource(audioPath);
      print('audioPath set :$audioPath');
      // - set latest start,end
      final sentenceToBegin = file.getAllSentences?.elementAtOrNull(startSentenceIndex);
      if([sentenceToBegin?.start,sentenceToBegin?.end].contains(null))return;
      ref.read(startEndProviderProvider.notifier).setNewValue(
          sentenceToBegin!.start!, sentenceToBegin.end!);
    }

    void pushDictProblemPage()=> navigatorKey.currentContext!.pushNamed('dictation',
              pathParameters: {'fileId': fileId.toString()});
    if(file==null)return Center(child: PlatformCircularProgressIndicator(),);
    return Center(
      child: PlatformTextButton(
        onPressed: () async{
          if(file.paragraphs.isCompleted){
            final shouldReset = await showConfirmDialog(
              context, 
              title: 'リセット', 
              description: 'すでに完全に解き終わっています.すべてリセットしますか？リセットされた回数は記録され、リセットしても正答率のデータは維持されます');
            if(shouldReset==true){
              await ref.read(fileNotifierProvider(fileId).notifier).resetSection();
              initDict();
              pushDictProblemPage();
            }
          }else{
              initDict(startSentenceIndex: 
                file.paragraphs.firstUnsolvedIndex
              );
              pushDictProblemPage();
          }
        },
        child: Text('ディクテーションを開始'),
      ),
    );
  }
}

class DictationProblemView extends ConsumerWidget {
  const DictationProblemView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPop() {
      ref.read(audioPlayerNotifierProvider.notifier).pause();
      hideKeyboard();
    }

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: PlatformCloseButton(onPop: onPop,),
          middle: Text('Dictation'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(5), 
            child: DictationCompletionRateIndicator(fileId)),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            InputTextField(fileId),
            SafeArea(
              child: Column(
                children: [
                  Expanded(child: DictationPageView(id: fileId)),
                  SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: PlayerWidget(fileId),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
