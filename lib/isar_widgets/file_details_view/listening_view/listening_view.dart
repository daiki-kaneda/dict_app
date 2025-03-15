import 'package:dict_app/isar_widgets/bottom_shell_widget.dart';
import 'package:dict_app/isar_widgets/file_details_view/listening_view/listening_page_view/listening_page_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_widget.dart';
import 'package:dict_app/isar_widgets/utils/platform_full_screen_dialog.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListeningView extends ConsumerWidget {
  const ListeningView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(audioPlayerNotifierProvider);
    ref.watch(playerStateProvider);
    ref.watch(playerPositionProvider);
    ref.watch(playerStateProvider);
    ref.watch(playerDurationProvider);
    ref.watch(startEndProviderProvider);

    void initListening() {
      final file = ref.read(fileNotifierProvider(fileId));
      if (file == null) return;
      // - set audio path to AudioPlayer
      final audioPath = file.audioPath;
      ref.read(audioPlayerNotifierProvider.notifier).setSource(audioPath);
      print('audioPath set :$audioPath');
      // - set latest start,end
      ref.read(startEndProviderProvider.notifier).setNewValue(
          file.getAllSentences!.first.start!, file.getAllSentences!.first.end!);
    }

    return Center(
      child: PlatformElevatedButton(
        onPressed: () {
          showPlatformFullScreenDialog(context,
              child: ListeningContentView(fileId));
        },
        child: Text('Start'),
      ),
    );
  }
}

class ListeningContentView extends StatelessWidget {
  const ListeningContentView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(),
      body: SafeArea(child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Column(
            children: [
              Expanded(child: ListeningPageView(id: fileId)),
              PlayerWidget()
            ],
          )),
        ],
      ),)
    );
  }
}
