import 'package:dict_app/models/log_entry.dart';
import 'package:dict_app/providers/logs_provider/logs_provider.dart';
import 'package:flutter/material.dart';

class LogsBarChart extends StatelessWidget {
  const LogsBarChart({super.key,required this.logs,required this.type});

  final List<LogEntry> logs;
  final LogPeriodType type;

  @override
  Widget build(BuildContext context,) {
    return Container();
  }
}