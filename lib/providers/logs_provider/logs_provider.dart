import 'package:dict_app/models/data_tree/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/log_entry.dart';
import 'package:dict_app/providers/datatree_provider/isar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logs_provider.g.dart';

@riverpod
class Logs extends _$Logs {
  @override
  List<LogEntry> build() {
    listenSelf((prev, next) {
      ref.invalidate(logsSizeProvider);
    });

    return isar.logEntrys.where().findAllSync();
  }

  Isar get isar => ref.read(isarProvider).requireValue;

  addLogEntry({required int fileId, required AnswerResult result}) {
    final newLogEntry =
        LogEntry(date: DateTime.now(), fileId: fileId, result: result);
    isar.writeTxnSync(() {
      isar.logEntrys.putSync(newLogEntry);
    });
    ref.invalidateSelf();
  }

  void deleteLogs({DateTime? before}) {
    if (before == null) {
      isar.writeTxnSync(() {
        final logsId =
            isar.logEntrys.where().findAllSync().map((e) => e.id).toList();
        isar.logEntrys.deleteAllSync(logsId);
      });
    } else {
      isar.writeTxnSync(() {
        final logsId = isar.logEntrys
            .filter()
            .dateLessThan(before)
            .findAllSync()
            .map((e) => e.id)
            .toList();
        isar.logEntrys.deleteAllSync(logsId);
      });
    }
    ref.invalidateSelf();
  }

  List<LogEntry> getLogsFromStartAndEnd(DateTime start, DateTime end) {
    return isar.logEntrys
        .where()
        .dateBetween(start, end, includeLower: false, includeUpper: true)
        .findAllSync();
  }
}

@Riverpod(keepAlive: true)
int logsSize(LogsSizeRef ref) {
  final isar = ref.read(isarProvider).requireValue;
  final size = isar.logEntrys.getSizeSync();
  print('Size of logEntrys :$size');
  return isar.logEntrys.getSizeSync();
}

@Riverpod(keepAlive: true)
class LogsFilterOption extends _$LogsFilterOption {
  @override
  LogPeriodType build() {
    return LogPeriodType.today;
  }

  update(LogPeriodType newType) {
    state = newType;
  }
}

@riverpod
List<LogEntry> filteredLogs(FilteredLogsRef ref) {
  final period = ref.watch(logsFilterOptionProvider);
  final isar = ref.read(isarProvider).requireValue;
  final now = DateTime.now();
  final range = period.range(now);
  return isar.logEntrys
      .where()
      .dateBetween(range.startDate, range.endDate,
          includeLower: false, includeUpper: true)
      .findAllSync();
}

enum LogPeriodType {
  today,
  pastWeek,
  pastMonth,
  pastSixMonths,
  pastYear;

  String getLabel(BuildContext context) {
    switch (this) {
      case LogPeriodType.today:
        return '今日';
      case LogPeriodType.pastWeek:
        return '今週';
      case LogPeriodType.pastMonth:
        return '今月';
      case LogPeriodType.pastSixMonths:
        return '半年';
      case LogPeriodType.pastYear:
        return '一年';
    }
  }

  ({DateTime startDate, DateTime endDate}) range(DateTime now) {
    switch (this) {
      case LogPeriodType.today:
        return (
          startDate: DateTime(now.year, now.month, now.day),
          endDate: DateTime(now.year, now.month, now.day, 23, 59, 59)
        );
      case LogPeriodType.pastWeek:
        return (
          startDate: DateTime(
            now.year,
            now.month,
            now.day - 6,
          ),
          endDate: DateTime(now.year, now.month, now.day, 23, 59, 59)
        );
      case LogPeriodType.pastMonth:
        return (
          startDate: DateTime(now.year, now.month),
          endDate: DateTime(now.year, now.month + 1, 0, 23, 59, 59)
        );
      case LogPeriodType.pastSixMonths:
        return (
          startDate: DateTime(now.year, now.month - 5),
          endDate: DateTime(now.year, now.month + 1, 0, 23, 59, 59)
        );
      case LogPeriodType.pastYear:
        return (
          startDate: DateTime(now.year, now.month - 11),
          endDate: DateTime(now.year, now.month + 1, 0, 23, 59, 59)
        );
    }
  }
}
