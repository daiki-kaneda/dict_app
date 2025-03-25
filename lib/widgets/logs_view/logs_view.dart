import 'dart:convert';
import 'dart:io';

import 'package:dict_app/providers/logs_provider/logs_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogsView extends StatelessWidget {
  const LogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('今日のデータ'),
      ),
      body: LogsContent(),
    );
  }
}

class LogsContent extends ConsumerWidget {
  const LogsContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logs = ref.watch(filteredLogsProvider);
    return ListView.builder(
      itemBuilder: (context, index) {
        return Text(jsonEncode(logs[index].toJson()));
      },
      itemCount: logs.length,
    );
  }
}

class PeriodTitle extends ConsumerWidget {
  const PeriodTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPeriod = ref.watch(logsFilterOptionProvider);
    return Text(currentPeriod.type.name);
  }
}

class ShowLogsViewButton extends ConsumerWidget {
  const ShowLogsViewButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformIconButton(
      onPressed: () async {
        context.pushNamed('logs');
      },
      icon: Icon(Platform.isIOS ? CupertinoIcons.chart_bar_fill : Icons.bar_chart),
    );
  }
}