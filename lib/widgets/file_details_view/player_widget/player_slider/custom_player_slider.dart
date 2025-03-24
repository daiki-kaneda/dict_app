import 'package:audioplayers/audioplayers.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:flutter/cupertino.dart';
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
    const double padInMilliseconds = 0;
    final duration = ref.watch(playerDurationProvider);
    final position = ref.watch(playerPositionProvider);
    final state = ref.watch(playerStateProvider);
    final setting = ref.watch(settingNotifierProvider);
    final audioNotifier = ref.read(audioPlayerNotifierProvider.notifier);
    final (startInMilliseconds, endInMilliseconds) = ref.watch(
        startEndProviderProvider.select((p) => (
              (p.start * 1000) - padInMilliseconds,
              (p.end * 1000) + padInMilliseconds
            )));
    assert(startInMilliseconds < endInMilliseconds);

    // if reached end, reset first position
    ref.listen(playerPositionProvider, (prev, next) {
      if (next.hasValue && next.value!.inMilliseconds >= endInMilliseconds) {
        audioNotifier.seek(Duration(milliseconds: startInMilliseconds.toInt()));
        if (setting.value?.repeatAudio != true) audioNotifier.pause();
      }
    });
    // if completion reset position
    ref.listen(playerStateProvider, (_, next) {
      if (next.value == PlayerState.completed) {
        if (setting.value?.repeatAudio == true) {
          audioNotifier
              .seek(Duration(milliseconds: startInMilliseconds.toInt()));
          audioNotifier.resume();
        } else {
          audioNotifier.seek(Duration(milliseconds: endInMilliseconds.toInt()));
          audioNotifier.pause();
        }
      }
    });
    final color = CupertinoColors.label.resolveFrom(context);
    final customDuration = endInMilliseconds - startInMilliseconds;
    if (duration.hasValue && position.hasValue && state.hasValue) {
      final positionInMilliseconds = position.value!.inMilliseconds.toDouble();
      final value =
          (positionInMilliseconds.toDouble() - startInMilliseconds.toDouble()) /
              customDuration;
      print(
          'position:${positionInMilliseconds.toDouble()}\n,start:${startInMilliseconds.toDouble()},\nvalue:$value,\n');
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
          audioNotifier.pause();
        },
        onChanged: (value) {
          final newPositionInMilliseconds =
              startInMilliseconds + value * customDuration;
          audioNotifier
              .seek(Duration(milliseconds: newPositionInMilliseconds.toInt()));
        },
        onChangeEnd: (_) {
          if (wasPlaying) {
            audioNotifier.resume();
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
