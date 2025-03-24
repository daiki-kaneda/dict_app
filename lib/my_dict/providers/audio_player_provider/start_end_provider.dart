import 'package:dict_app/my_dict/providers/audio_player_provider/audio_player_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'start_end_provider.g.dart';

@riverpod
class StartEndProvider extends _$StartEndProvider {
  @override
  ({double start,double end}) build() {
    listenSelf((previous, next) {
      ref.read(audioPlayerNotifierProvider.notifier)
      .seek(Duration(milliseconds: (next.start*1000).toInt()));
    },);
    return (start: 0,end: 1);
  }

  void setNewValue(double start,double end){
    state = (start:start,end:end);
  }

}