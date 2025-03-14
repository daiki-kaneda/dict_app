
import 'package:dict_app/isar_widgets/bottom_shell_widget.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:flutter/material.dart';
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
    ref.watch(currentSentenceIndexInAllSentencesProvider(fileId));
    ref.watch(sentencePageControllerProvider(fileId));
    return SafeArea(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            child: PageView(
          children: List.generate(
              10,
              (i) => ColoredBox(
                    color: Colors.red,
                    child: Center(
                      child: Text(i.toString()),
                    ),
                  )),
        )),
        BottomShellWidgetPlaceHolder()
      ],
    ));
  }
}
