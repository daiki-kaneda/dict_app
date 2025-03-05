import 'dart:convert';

import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FileDetailsView extends ConsumerWidget {
  const FileDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(fileProvider(id));

    return SafeArea(child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(file?.title ?? ''),
        ),
        child: CustomScrollView(
          slivers: [
            // CupertinoSliverNavigationBar(
            //   largeTitle: Text(file?.fileName ?? ''),
            // ),
            SliverFillRemaining(
              child: Center(
                  child: file != null
                      ? Text(jsonEncode(file.toJson())
                      )
                      : PlatformCircularProgressIndicator()),
            )
          ],
        )));
  }
}
