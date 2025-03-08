import 'dart:convert';

import 'package:dict_app/isar_widgets/file_details_view/dictation_page_view/dictation_page_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/input_text_field.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_widget.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_completion_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileDetailsView extends ConsumerWidget {
  const FileDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(fileNotifierProvider(id));

    // range of audio to play update when sentence index changed
    ref.listen(currentSentenceIndexProvider, (_, i) {
      final s = file?.getAllSentences?[i];
      ref
          .read(startEndProviderProvider.notifier)
          .setNewValue(s?.start ?? 0, s?.end ?? 0);
    });

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: FileNavTitle(),
          trailing: FileNavTrailing(),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            InputTextField(FocusNode()..requestFocus()),
            Column(
              children: [
                Expanded(child: DictationPageView(id: id)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PlayerWidget(),
                )
              ],
            ),
          ],
        ));
  }
}

class FileNavTitle extends ConsumerWidget {
  const FileNavTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('data');
  }
}

class FileNavTrailing extends ConsumerWidget {
  const FileNavTrailing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
