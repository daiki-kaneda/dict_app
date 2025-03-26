import 'package:dict_app/providers/logs_provider/logs_provider.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class LogsBarChartYear extends ConsumerWidget {
  const LogsBarChartYear(this.now, {super.key});

  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = _fetchLogValues(ref);
    final int maxValue = values.reduce((a, b) => a > b ? a : b);

    return BarChart(
      BarChartData(
        barTouchData: _barTouchData,
        titlesData: _titlesData,
        borderData: _borderData,
        barGroups: _barGroups(values),
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValue + 10,
      ),
    );
  }

  List<int> _fetchLogValues(WidgetRef ref) {
    return pastYearListBuilder(now, (start, end) {
      return ref
          .read(logsProvider.notifier)
          .getLogsFromStartAndEnd(start, end)
          .where((l) => l.isSuccess())
          .length;
    });
  }

  BarTouchData get _barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
            NumberFormat.compact().format(rod.toY.round()),
            const TextStyle(
              color: CupertinoColors.systemCyan,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget _getTitles(double value, TitleMeta meta) {
    final style = const TextStyle(
      color: CupertinoColors.systemBlue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    final titles = pastYearTitleList(now,locale: 'ja');
    final text = titles.elementAtOrNull(value.toInt()) ?? '';

    return SideTitleWidget(
      meta: meta,
      space: 3,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get _titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: _getTitles,
          ),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );

  FlBorderData get _borderData => FlBorderData(show: false);

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [CupertinoColors.systemBlue, CupertinoColors.systemCyan],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> _barGroups(List<int> values) => values.indexed
      .map((t) => BarChartGroupData(
            x: t.$1,
            barRods: [
              BarChartRodData(
                toY: t.$2.toDouble(),
                gradient: _barsGradient,
              )
            ],
            showingTooltipIndicators: t.$2 == 0 ? [] : [0],
          ))
      .toList();
}

class LogsBarChart6Months extends ConsumerWidget {
  const LogsBarChart6Months(this.now, {super.key});

  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = _fetchLogValues(ref);
    final int maxValue = values.reduce((a, b) => a > b ? a : b);

    return BarChart(
      BarChartData(
        barTouchData: _barTouchData,
        titlesData: _titlesData,
        borderData: _borderData,
        barGroups: _barGroups(values),
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValue + 10,
      ),
    );
  }

  List<int> _fetchLogValues(WidgetRef ref) {
    return past6MonthsListBuilder(now, (start, end) {
      return ref
          .read(logsProvider.notifier)
          .getLogsFromStartAndEnd(start, end)
          .where((l) => l.isSuccess())
          .length;
    });
  }

  BarTouchData get _barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
            NumberFormat.compact().format(rod.toY.round()),
            const TextStyle(
              color: CupertinoColors.systemCyan,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget _getTitles(double value, TitleMeta meta) {
    final style = const TextStyle(
      color: CupertinoColors.systemBlue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    final titles = past6MonthsTitleList(now,locale: 'ja');
    final text = titles.elementAtOrNull(value.toInt()) ?? '';

    return SideTitleWidget(
      meta: meta,
      space: 3,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get _titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: _getTitles,
          ),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );

  FlBorderData get _borderData => FlBorderData(show: false);

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [CupertinoColors.systemBlue, CupertinoColors.systemCyan],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> _barGroups(List<int> values) => values.indexed
      .map((t) => BarChartGroupData(
            x: t.$1,
            barRods: [
              BarChartRodData(
                toY: t.$2.toDouble(),
                gradient: _barsGradient,
              )
            ],
            showingTooltipIndicators: t.$2 == 0 ? [] : [0],
          ))
      .toList();
}

class LogsBarChartMonth extends ConsumerWidget {
  const LogsBarChartMonth(this.now, {super.key});

  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = _fetchLogValues(ref);
    final int maxValue = values.reduce((a, b) => a > b ? a : b);

    return BarChart(
      BarChartData(
        barTouchData: _barTouchData,
        titlesData: _titlesData,
        borderData: _borderData,
        barGroups: _barGroups(values),
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValue + 10,
      ),
    );
  }

  List<int> _fetchLogValues(WidgetRef ref) {
    return pastMonthListBuilder(now, (start, end) {
      return ref
          .read(logsProvider.notifier)
          .getLogsFromStartAndEnd(start, end)
          .where((l) => l.isSuccess())
          .length;
    });
  }

  BarTouchData get _barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
            NumberFormat.compact().format(rod.toY.round()),
            const TextStyle(
              color: CupertinoColors.systemCyan,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget _getTitles(double value, TitleMeta meta) {
    final style = const TextStyle(
      color: CupertinoColors.systemBlue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    final titles = pastMonthTitleList(now);
    final text = value.toInt() % 8 == 0
        ? titles.elementAtOrNull(value.toInt()) ?? ''
        : '';

    return SideTitleWidget(
      meta: meta,
      space: 3,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get _titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: _getTitles,
          ),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );

  FlBorderData get _borderData => FlBorderData(show: false);

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [CupertinoColors.systemBlue, CupertinoColors.systemCyan],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> _barGroups(List<int> values) => values.indexed
      .map((t) => BarChartGroupData(
            x: t.$1,
            barRods: [
              BarChartRodData(
                toY: t.$2.toDouble(),
                gradient: _barsGradient,
              )
            ],
            showingTooltipIndicators: t.$2 == 0 ? [] : [0],
          ))
      .toList();
}

class LogsBarChartWeek extends ConsumerWidget {
  const LogsBarChartWeek(this.now, {super.key});

  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = _fetchLogValues(ref);
    final int maxValue = values.reduce((a, b) => a > b ? a : b);

    return BarChart(
      BarChartData(
        barTouchData: _barTouchData,
        titlesData: _titlesData,
        borderData: _borderData,
        barGroups: _barGroups(values),
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValue + 10,
      ),
    );
  }

  List<int> _fetchLogValues(WidgetRef ref) {
    return pastWeekListBuilder(now, (start, end) {
      return ref
          .read(logsProvider.notifier)
          .getLogsFromStartAndEnd(start, end)
          .where((l) => l.isSuccess())
          .length;
    });
  }

  BarTouchData get _barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
            NumberFormat.compact().format(rod.toY.round()),
            const TextStyle(
              color: CupertinoColors.systemCyan,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget _getTitles(double value, TitleMeta meta) {
    final style = const TextStyle(
      color: CupertinoColors.systemBlue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    final titles = pastWeekTitleList(now);
    final text = titles.elementAtOrNull(value.toInt()) ?? '';

    return SideTitleWidget(
      meta: meta,
      space: 3,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get _titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: _getTitles,
          ),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );

  FlBorderData get _borderData => FlBorderData(show: false);

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [CupertinoColors.systemBlue, CupertinoColors.systemCyan],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> _barGroups(List<int> values) => values.indexed
      .map((t) => BarChartGroupData(
            x: t.$1,
            barRods: [
              BarChartRodData(
                toY: t.$2.toDouble(),
                gradient: _barsGradient,
              )
            ],
            showingTooltipIndicators: t.$2 == 0 ? [] : [0],
          ))
      .toList();
}

class LogsBarChartDay extends ConsumerWidget {
  const LogsBarChartDay(this.now, {super.key});

  final DateTime now;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final values = _fetchLogValues(ref);
    final int maxValue = values.reduce((a, b) => a > b ? a : b);

    return BarChart(
      BarChartData(
        barTouchData: _barTouchData,
        titlesData: _titlesData,
        borderData: _borderData,
        barGroups: _barGroups(values),
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValue + 10,
      ),
    );
  }

  List<int> _fetchLogValues(WidgetRef ref) {
    return past24hoursListBuilder(now, (start, end) {
      return ref
          .read(logsProvider.notifier)
          .getLogsFromStartAndEnd(start, end)
          .where((l) => l.isSuccess())
          .length;
    });
  }

  BarTouchData get _barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
            NumberFormat.compact().format(rod.toY.round()),
            const TextStyle(
              color: CupertinoColors.systemCyan,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );

  Widget _getTitles(double value, TitleMeta meta) {
    final style = const TextStyle(
      color: CupertinoColors.systemBlue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    final titles = past24hoursTitleList(now);
    final text = [00, 06, 12, 18].contains(value.toInt())
        ? titles.elementAtOrNull(value.toInt()) ?? ''
        : '';

    return SideTitleWidget(
      meta: meta,
      space: 3,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get _titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: _getTitles,
          ),
        ),
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      );

  FlBorderData get _borderData => FlBorderData(show: false);

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [CupertinoColors.systemBlue, CupertinoColors.systemCyan],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> _barGroups(List<int> values) => values.indexed
      .map((t) => BarChartGroupData(
            x: t.$1,
            barRods: [
              BarChartRodData(
                toY: t.$2.toDouble(),
                gradient: _barsGradient,
              )
            ],
            showingTooltipIndicators: t.$2 == 0 ? [] : [0],
          ))
      .toList();
}
