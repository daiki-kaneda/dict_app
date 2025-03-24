import 'dart:developer';

import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_duration_provider.g.dart';

@riverpod
Stream<Duration> playerDuration(PlayerDurationRef ref) {
  final player = ref.watch(audioPlayerNotifierProvider);
  return player.onDurationChanged
  ..listen((duration) {
    // if(duration.inMilliseconds % 1000 ==0){
      log('total:${duration.toString()}');
    });
}