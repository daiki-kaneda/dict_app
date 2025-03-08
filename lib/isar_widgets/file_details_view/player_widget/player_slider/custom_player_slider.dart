import 'package:audioplayers/audioplayers.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomPlayerSlider extends ConsumerStatefulWidget {
  const CustomPlayerSlider({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerSliderState();
}

class _PlayerSliderState extends ConsumerState<CustomPlayerSlider> {
  bool wasPlaying = false;
  @override
  Widget build(BuildContext context) {
    final duration = ref.watch(playerDurationProvider);
    final position = ref.watch(playerPositionProvider);
    final state = ref.watch(playerStateProvider);
    final (startInMilliseconds, endInMilliseconds) = ref.watch(
        startEndProviderProvider
            .select((p) => ((p.start * 1000).toInt(), (p.end * 1000).toInt())));
    assert(startInMilliseconds < endInMilliseconds);

    // if reached end, reset first position
    ref.listen(playerPositionProvider, (prev, next) {
      if (next.hasValue && next.value!.inMilliseconds >= endInMilliseconds) {
        ref
            .read(audioPlayerNotifierProvider.notifier)
            .seek(Duration(milliseconds: startInMilliseconds));
      }
    });
    final color = CupertinoColors.label.resolveFrom(context);
    final customDuration =
        endInMilliseconds.toDouble() - startInMilliseconds.toDouble();
    if (duration.hasValue && position.hasValue && state.hasValue) {
      final positionInMilliseconds = position.value!.inMilliseconds.toDouble();
      final value =
          (positionInMilliseconds.toDouble() - startInMilliseconds.toDouble()) /
              customDuration;
      print('value:$value');
      return PlatformSlider(
        min: 0,
        max: 1,
        value: value.clamp(0, 1).toDouble(),
        activeColor: color,
        onChangeStart: (_) {
          setState(() {
            if (state.value == PlayerState.playing) {
              wasPlaying = true;
            } else {
              wasPlaying = false;
            }
          });
          ref.read(audioPlayerNotifierProvider.notifier).pause();
        },
        onChanged: (value) {
          final newPositionInMilliseconds =
              startInMilliseconds + value * customDuration;
          ref
              .read(audioPlayerNotifierProvider.notifier)
              .seek(Duration(milliseconds: newPositionInMilliseconds.toInt()));
        },
        onChangeEnd: (_) {
          if (wasPlaying) {
            ref.read(audioPlayerNotifierProvider.notifier).resume();
          }
        },
      );
    } else {
      return PlatformSlider(
        value: 0,
        activeColor: color,
        onChanged: (value) {},
      );
    }
  }
}
