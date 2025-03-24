import 'dart:developer';

import 'package:dict_app/my_dict/providers/audio_player_provider/audio_player_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_position_provider.g.dart';

@riverpod
Stream<Duration> playerPosition(PlayerPositionRef ref) {
  final player = ref.watch(audioPlayerNotifierProvider);
  return player.onPositionChanged
  ..listen((duration) {
    // if(duration.inMilliseconds % 1000 ==0){
      log('${duration.inSeconds} sec');
    }
  //}
  );
}