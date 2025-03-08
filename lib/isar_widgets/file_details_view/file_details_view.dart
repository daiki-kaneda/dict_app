import 'dart:convert';

import 'package:dict_app/isar_widgets/dictation_page/dictation_page_view.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/player_widget/player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileDetailsView extends ConsumerWidget{
  const FileDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.watch(fileProvider(id));

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: FileNavTitle(),
          trailing: FileNavTrailing(),
        ),
        child:Column(
          children: [
            Expanded(
              child: DictationPageView(id: id)),
            PlayerWidget()
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
