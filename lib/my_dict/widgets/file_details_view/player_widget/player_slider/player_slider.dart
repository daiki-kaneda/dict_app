
import 'package:audioplayers/audioplayers.dart';
import 'package:dict_app/my_dict/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/my_dict/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/my_dict/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/my_dict/providers/audio_player_provider/player_state_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerSlider extends ConsumerStatefulWidget {
  const PlayerSlider({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerSliderState();
}

class _PlayerSliderState extends ConsumerState<PlayerSlider> {
  bool wasPlaying = false;
  @override
  Widget build(BuildContext context) {
    final duration = ref.watch(playerDurationProvider);
    final position = ref.watch(playerPositionProvider);
    final state = ref.watch(playerStateProvider);

    final color = CupertinoColors.label.resolveFrom(context);
    if(duration.hasValue&&position.hasValue&&state.hasValue){
      return Slider(
        max: duration.value!.inMilliseconds.toDouble(),
        value: position.value!.inMilliseconds.toDouble().clamp(0.0, duration.value!.inMilliseconds.toDouble()), 
        activeColor: color,
        onChangeStart: (_){
          setState(() {
            if (state.value == PlayerState.playing) {
              wasPlaying=true;
            }else{
              wasPlaying=false;
            }
          });
          ref.read(audioPlayerNotifierProvider.notifier)
          .pause();
        },
        onChanged: (value){
          ref.read(audioPlayerNotifierProvider.notifier)
          .seek(Duration(milliseconds: value.toInt()));
        },
        onChangeEnd: (value) {
          if (wasPlaying) {
            ref.read(audioPlayerNotifierProvider.notifier).resume();
          }
        },);
    }else{
      return Slider(
        value:0, 
        activeColor: color,
        onChanged: (value){},
        );
    }
  }
}