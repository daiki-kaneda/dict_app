import 'dart:io';

import 'package:dict_app/models/data_tree/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/logs_provider/logs_provider.dart';
import 'package:dict_app/widgets/logs_view/logs_bar_chart.dart';
import 'package:dict_app/widgets/utils/platform_list_section.dart';
import 'package:dict_app/widgets/utils/platform_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogsView extends ConsumerWidget {
  const LogsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(logsFilterOptionProvider);
    final logs = ref.watch(filteredLogsProvider);

    final backgroundColor = Platform.isIOS
        ? CupertinoColors.systemGroupedBackground.resolveFrom(context)
        : null;
    return PlatformScaffold(
      backgroundColor: backgroundColor,
      appBar: PlatformAppBar(
        backgroundColor: backgroundColor,
        title: PeriodTitle(),
      ),
      body: ListView(
        children: [
          PlatformListSection(children: [
            AspectRatio(
                aspectRatio: 1.6,
                child: LogBarChart(
                  dataAndTitle: [],
                )),
          ]),
          PeriodPicker(),
          LogsDetails()
        ],
      ),
    );
  }
}

class PeriodPicker extends ConsumerWidget {
  const PeriodPicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialItem = ref.read(logsFilterOptionProvider);
    final types = LogPeriodType.values;

    return PlatformListSection(children: [
      SizedBox(
        height: 200,
        child: PlatformPicker(
            itemExtent: 50,
            scrollController: FixedExtentScrollController(
                initialItem: types.indexOf(initialItem)),
            onSelectedItemChanged: (i) =>
                ref.read(logsFilterOptionProvider.notifier).update(types[i]),
            children: types.map((t) => Text(t.name)).toList()),
      )
    ]);
  }
}

class LogsDetails extends ConsumerWidget {
  const LogsDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredLogs = ref.watch(filteredLogsProvider);
    return PlatformListSection(children: [
      PlatformListTile(
        title: Text('ヒントを使わずに入力した文字数'),
        trailing: Text(
            '${filteredLogs.where((l) => l.result.status != SolveStatus.unSolved && l.result.solveAnyway == false).length}'),
      )
    ]);
  }
}

class PeriodTitle extends ConsumerWidget {
  const PeriodTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentType = ref.watch(logsFilterOptionProvider);
    return Text(currentType.name);
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
      icon: Icon(
          Platform.isIOS ? CupertinoIcons.chart_bar_fill : Icons.bar_chart),
    );
  }
}
