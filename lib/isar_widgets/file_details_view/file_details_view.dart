import 'dart:convert';

import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/dictation_page_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/input_text_field.dart';
import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/listening_view/listening_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_widget.dart';
import 'package:dict_app/isar_widgets/file_details_view/print_view/print_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/setting_view/setting_view.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileDetailsView extends ConsumerWidget {
  const FileDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(fileNotifierProvider(id));

    final index = ref.watch(currentTabIndexProvider);
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: FileNavTitle(),
          trailing: FileNavTrailing(),
        ),
        child:[
          DictationView(id),
          ListeningView(id),
          PrintView(id),
          SettingView(id),
        ][index]
        );
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
