import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/dictation_page_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/input_text_field.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_widget.dart';
import 'package:dict_app/isar_widgets/utils/platform_full_screen_dialog.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictationView extends ConsumerWidget {
  const DictationView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(audioPlayerNotifierProvider);

    return Center(
      child: PlatformTextButton(
        onPressed: () {
          // initialize dictation
          
          showPlatformFullScreenDialog(context,
              child: DictationProblemView(fileId));
        },
        child: Text('start dictation'),
      ),
    );
  }
}

class DictationProblemView extends StatelessWidget {
  const DictationProblemView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Dictation'),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            InputTextField(FocusNode()..requestFocus()),
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
