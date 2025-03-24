import 'package:audioplayers/audioplayers.dart';
import 'package:dict_app/my_dict/providers/audio_player_provider/audio_player_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_state_provider.g.dart';

@riverpod
Stream<PlayerState> playerState(PlayerStateRef ref) async*{
  final player = ref.watch(audioPlayerNotifierProvider);
  yield PlayerState.stopped;
  yield* player.onPlayerStateChanged
  ..listen((event) {
    print('audio state:${event.toString()}');
  });
}