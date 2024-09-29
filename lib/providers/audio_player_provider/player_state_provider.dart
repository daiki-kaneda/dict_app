import 'package:audioplayers/audioplayers.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_state_provider.g.dart';

@riverpod
Stream<PlayerState> playerState(PlayerStateRef ref) async*{
  final player = ref.watch(audioPlayerNotifierProvider);
  yield PlayerState.stopped;
  yield* player.onPlayerStateChanged
  ..listen((event) {
    // ref.read(toastNotifierProvider.notifier)
    // .showToast('audio state:${event.toString()}');
  });
}