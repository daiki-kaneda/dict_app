import 'package:dict_app/providers/logs_provider/logs_provider.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class LogsBarChartByType extends ConsumerWidget {
  const LogsBarChartByType(
      {super.key, required this.type, required this.now, this.locale});

  final LogPeriodType type;
  final DateTime now;
  final String? locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsNotifier = ref.read(logsProvider.notifier);
    List<int> logValues;
    List<String> titles;

    switch (type) {
      case LogPeriodType.today:
        {
          logValues = past24hoursListBuilder(now, (start, end) {
            return logsNotifier
                .getLogsFromStartAndEnd(start, end)
                .where((l) => l.isSuccess())
                .length;
          });
          titles = past24hoursTitleList(now, locale: locale).indexed.map(
            (t)=>[0,6,12,18].contains(t.$1) ? t.$2:''
          ).toList();
        }
      case LogPeriodType.pastWeek:
        {
          logValues = pastWeekListBuilder(now, (start, end) {
            return logsNotifier
                .getLogsFromStartAndEnd(start, end)
                .where((l) => l.isSuccess())
                .length;
          });
          titles = pastWeekTitleList(now, locale: locale);
        }
      case LogPeriodType.pastMonth:
        {
          logValues = pastMonthListBuilder(now, (start, end) {
            return logsNotifier
                .getLogsFromStartAndEnd(start, end)
                .where((l) => l.isSuccess())
                .length;
          });
          titles = pastMonthTitleList(now, locale: locale).indexed.map(
            (t)=>List.generate(8, (i)=>i*4).contains(t.$1) ? t.$2:''
          ).toList();
        }
      case LogPeriodType.pastSixMonths:
        {
          logValues = past6MonthsListBuilder(now, (start, end) {
            return logsNotifier
                .getLogsFromStartAndEnd(start, end)
                .where((l) => l.isSuccess())
                .length;
          });
          titles = past6MonthsTitleList(now, locale: locale);
        }
      case LogPeriodType.pastYear:
        {
          logValues = pastYearListBuilder(now, (start, end) {
            return logsNotifier
                .getLogsFromStartAndEnd(start, end)
                .where((l) => l.isSuccess())
                .length;
          });
          titles = pastYearTitleList(now, locale: locale);
        }
    }
    return LogsBarChartStatic(
      logValues: logValues,
      titles: titles,
    );
  }
}

class LogsBarChartStatic extends StatelessWidget {
  const LogsBarChartStatic(
      {super.key, this.logValues = const [], this.titles = const []});

  final List<int> logValues;
  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    final int maxValue = logValues.reduce((a, b) => a > b ? a : b);

    return BarChart(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      BarChartData(
        barTouchData: _barTouchData,
        titlesData: _titlesData,
        borderData: _borderData,
        barGroups: _barGroups(logValues),
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValue + maxValue*0.1 + 10,
      ),
    );
  }

  BarTouchData get _barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          fitInsideVertically: true,
          fitInsideHorizontally: false,
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final format = NumberFormat.compact();
            format.maximumFractionDigits=1;
            return BarTooltipItem(
              format.format(rod.toY.round()),
            const TextStyle(
              color: CupertinoColors.systemCyan,
              fontWeight: FontWeight.bold,
            ),
          );}
        ),
      );

  Widget _getTitles(double value, TitleMeta meta) {
    final style = const TextStyle(
      color: CupertinoColors.systemBlue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
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