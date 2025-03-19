import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class StatsView extends StatelessWidget {
  const StatsView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(),
      body: Center(
        child: Text('settings'),
      ),
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