import 'package:audioplayers/audioplayers.dart';
import 'package:dict_app/providers/app_directory_provider/app_documents_directory_provider.dart';
import 'package:dict_app/providers/app_directory_provider/app_support_directory_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_player_provider.g.dart';

@riverpod
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  @override
  AudioPlayer build() {
    ref.watch(playerStateProvider);
    ref.watch(playerPositionProvider);
    ref.watch(playerStateProvider);
    ref.watch(playerDurationProvider);
    ref.watch(startEndProviderProvider);
    final player = AudioPlayer();
    // audio player can have only one source.
    ref.onDispose((){
      player.dispose();
    });
    return player;
  }
  
  Future<void> setSource(String filePath)async{
    // 新しい音声のソースをセットする
    final source = await ref.read(appSupportDirectoryNotifierProvider.notifier)
    .fullPath(filePath);
    state.setSource(DeviceFileSource(source));
  }

  Future<void> resume()async{
    //音声を現在地点からプレイする(デフォルトでは初めから)
    state.resume();
  }

  Future<void> seek(Duration position)async{
    // 音声のプレイする位置を動かす
    state.seek(position);
  }

  Future<void> pause()async{
    // 音声を一時停止する
    state.pause();
  }

  Future<void> _stop()async{
    // 音声を停止して、位置をリセットする
    state.stop();
  }

  Future<void> _release()async{
    // 音声をstopして、リソースをリリースする
    state.release();
  }

  Future<void> setPlayBackrate(SpeedStatus status)async{
    // 音声のスピードを調整する
    assert(status.rate>=0.5&&status.rate<=2.0);
    await state.setPlaybackRate(status.rate); // half speed
  }

  Future<void> prepare(String filePath)async{
    // playerを開く時の処理
      // set playBackRate to 1.0 because of SpeedButton logic
    setPlayBackrate(SpeedStatus.normal);
      // 新しい音声のソースをセットする
    final source = await ref.read(appSupportDirectoryNotifierProvider.notifier)
    .fullPath(filePath);
    state.setSource(DeviceFileSource(source));
  }
}

enum SpeedStatus{
  verySlow,slow,normal,veryFast,fast;

  double get rate{
    switch(this){
      case verySlow:return 0.5;
      case slow:return 0.75;
      case normal:return 1.0;
      case fast:return 1.5;
      case veryFast:return 2.0;
    }
  }
}