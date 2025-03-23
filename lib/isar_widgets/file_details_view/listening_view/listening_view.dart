
import 'package:dict_app/isar_widgets/file_details_view/listening_view/listening_page_view/listening_page_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_widget.dart';
import 'package:dict_app/isar_widgets/setting_view/setting_view.dart';
import 'package:dict_app/isar_widgets/utils/close_button.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ListeningView extends ConsumerWidget {
  const ListeningView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(audioPlayerNotifierProvider);
    ref.watch(playerStateProvider);
    ref.watch(playerPositionProvider);
    ref.watch(playerStateProvider);
    ref.watch(playerDurationProvider);
    ref.watch(startEndProviderProvider);

    void initListening() {
      final file = ref.read(fileNotifierProvider(fileId));
      final setting = ref.read(settingNotifierProvider).value;
      if (file == null|| setting==null) return;

      // make translated sentences
      ref.read(settingNotifierProvider.notifier).createTranslatedSentences(fileId);

      // - set audio path to AudioPlayer
      final audioPath = file.audioPath;
      ref.read(audioPlayerNotifierProvider.notifier).setSource(audioPath);
      print('audioPath set :$audioPath');
      // - set latest start,end
      ref.read(startEndProviderProvider.notifier).setNewValue(
          file.getAllSentences.first.start!, file.getAllSentences.first.end!);
    }

    return Center(
      child: PlatformTextButton(
        onPressed: () {
          initListening();
          context.pushNamed('listening',
              pathParameters: {'fileId': fileId.toString()});
        },
        child: Text('リスニングを開始',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}

class ListeningContentView extends ConsumerWidget {
  const ListeningContentView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onPop() {
      ref.read(audioPlayerNotifierProvider.notifier).pause();
    }

    return PlatformScaffold(
        appBar: PlatformAppBar(
          leading: PlatformCloseButton(onPop: onPop),
          title: Text('Listening'),
          trailingActions: [ShowSettingViewButton()],
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Column(
                children: [
                  Expanded(child: ListeningPageView(id: fileId)),
                  SizedBox(
                    height: 15,
                  ),
                  PlayerWidget(fileId)
                ],
              )),
            ],
          ),
        ));
  }
}
