import 'dart:io';

import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class StatsView extends ConsumerWidget {
  const StatsView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isIOS = Platform.isIOS;
    final section = ref.watch(fileNotifierProvider(fileId).select(
      (f)=>f?.paragraphs
    ));
    final backgroundColor = isIOS ? CupertinoColors.systemGroupedBackground.resolveFrom(context):null;
    if(section==null)return LoadingPage(backgroundColor: backgroundColor);
    return PlatformScaffold(
      backgroundColor: backgroundColor,
      appBar: PlatformAppBar(
        backgroundColor: backgroundColor,
        title: Text('統計'),
      ),
      body: ListView(
        children: [
          CupertinoListSection.insetGrouped(
            hasLeading: false,
            children: [
              PlatformListTile(
                title: Text('クリア回数:'),
                trailing: Text('${section.completedCount}'),)
            ],
          ),
          CupertinoListSection.insetGrouped(
            header: Text('正答率'),
            hasLeading: false,
            children: [
              PlatformListTile(title: Text('全体の正答率'),
              trailing: Text('${NumberFormat.percentPattern('${section.accuracy() ?? 0}')}'),
              )
            ],
          ),
        ],
      )
    );
  }
}

class ShowStatsButton extends StatelessWidget {
  const ShowStatsButton(this.fileId,{super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      onPressed: () => context.pushNamed('stats', pathParameters: {'fileId': fileId.toString()}),
      icon: Icon(Platform.isIOS ? CupertinoIcons.chart_bar:Icons.bar_chart),
    );
  }
}