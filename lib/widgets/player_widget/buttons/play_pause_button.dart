import 'package:audioplayers/audioplayers.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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
            return PlatformIconButton(onPressed: () {
              ref.read(audioPlayerNotifierProvider.notifier)
              .resume();
            }, icon: Icon(
              CupertinoIcons.play_fill,
              color: color,));
          }
        case PlayerState.paused:
          {
            return PlatformIconButton(onPressed: () {
              ref.read(audioPlayerNotifierProvider.notifier)
              .resume();
            }, icon: Icon(CupertinoIcons.play_fill,
            color: color,
            ));
          }
        case PlayerState.stopped:
          {
            return PlatformIconButton(onPressed: () {
              ref.read(audioPlayerNotifierProvider.notifier)
              .resume();
            }, icon: Icon(CupertinoIcons.play_fill,
            color: color,));
          }
        case PlayerState.playing:
          {
            return PlatformIconButton(onPressed: () {
              ref.read(audioPlayerNotifierProvider.notifier)
              .pause();
            }, icon:Icon(CupertinoIcons.pause_fill,
            color: color,));
          }
        case PlayerState.disposed:
          {
            return PlatformIconButton(
                onPressed: null, icon: Icon(
                  CupertinoIcons.play_fill,
                  color: color,));
          }
      }
    } else {
      return PlatformIconButton(
        onPressed: null, icon: Icon(
          CupertinoIcons.xmark_circle,
          color: color,));
    }
  }
}
