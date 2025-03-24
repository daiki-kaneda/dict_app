
import 'package:dict_app/my_dict/providers/audio_player_provider/audio_player_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_completion_provider.g.dart';

@riverpod
Stream<void> playerCompletion(PlayerCompletionRef ref) {
  final player = ref.watch(audioPlayerNotifierProvider);
  return player.onPlayerComplete;
}