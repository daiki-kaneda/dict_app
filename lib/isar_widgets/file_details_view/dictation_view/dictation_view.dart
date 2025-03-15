import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/dictation_page_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/input_text_field.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_widget.dart';
import 'package:dict_app/isar_widgets/utils/close_button.dart';
import 'package:dict_app/isar_widgets/utils/platform_full_screen_dialog.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DictationView extends ConsumerWidget {
  const DictationView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(audioPlayerNotifierProvider);
    ref.watch(playerStateProvider);
    ref.watch(playerPositionProvider);
    ref.watch(playerStateProvider);
    ref.watch(playerDurationProvider);
    ref.watch(startEndProviderProvider);

    void initDict() {
      final file = ref.read(fileNotifierProvider(fileId));
      if (file == null) return;
      // - set audio path to AudioPlayer
      final audioPath = file.audioPath;
      ref.read(audioPlayerNotifierProvider.notifier).setSource(audioPath);
      print('audioPath set :$audioPath');
      // // - set latest start,end
      ref.read(startEndProviderProvider.notifier).setNewValue(
          file.getAllSentences!.first.start!, file.getAllSentences!.first.end!);
    }

    return Center(
      child: PlatformElevatedButton(
        onPressed: () {
          initDict();
          context.pushNamed('dictation',
              pathParameters: {'fileId': fileId.toString()});
        },
        child: Text('Start'),
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
    }

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: PlatformCloseButton(onPop: onPop,),
          middle: Text('Dictation'),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            InputTextField(FocusNode()..requestFocus(), fileId),
            SafeArea(
              child: Column(
                children: [
                  Expanded(child: DictationPageView(id: fileId)),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: PlayerWidget(),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
