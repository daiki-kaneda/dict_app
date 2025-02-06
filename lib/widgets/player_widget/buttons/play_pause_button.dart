import 'package:audioplayers/audioplayers.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayPauseButton extends ConsumerWidget {
  const PlayPauseButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(playerStateProvider);

    final color = CupertinoColors.label.resolveFrom(context);

    if (state.hasValue) {
      final playerState = state.value!;
      switch (playerState) {
        case PlayerState.completed:
          {
            return CupertinoButton(onPressed: () {
              ref.read(audioPlayerNotifierProvider.notifier)
              .resume();
            }, child: Icon(
              CupertinoIcons.play_fill,
              color: color,));
          }
        case PlayerState.paused:
          {
            return CupertinoButton(onPressed: () {
              ref.read(audioPlayerNotifierProvider.notifier)
              .resume();
            }, child: Icon(CupertinoIcons.play_fill,
            color: color,
            ));
          }
        case PlayerState.stopped:
          {
            return CupertinoButton(onPressed: () {
              ref.read(audioPlayerNotifierProvider.notifier)
              .resume();
            }, child: Icon(CupertinoIcons.play_fill,
            color: color,));
          }
        case PlayerState.playing:
          {
            return CupertinoButton(onPressed: () {
              ref.read(audioPlayerNotifierProvider.notifier)
              .pause();
            }, child:Icon(CupertinoIcons.pause_fill,
            color: color,));
          }
        case PlayerState.disposed:
          {
            return CupertinoButton(
                onPressed: null, child: Icon(
                  CupertinoIcons.play_fill,
                  color: color,));
          }
      }
    } else {
      return CupertinoButton(
        onPressed: null, child: Icon(
          CupertinoIcons.xmark_circle,
          color: color,));
    }
  }
}
