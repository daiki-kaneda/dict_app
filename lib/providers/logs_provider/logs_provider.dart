import 'package:dict_app/models/data_tree/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/log_entry.dart';
import 'package:dict_app/providers/datatree_provider/isar_provider.dart';
import 'package:intl/intl.dart';
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
  final logs = ref.watch(logsProvider);
  return logs.where((e) => period.containsDate(e.date)).toList();
}

enum LogPeriodType {
  today,
  pastWeek,
  pastMonth,
  pastSixMonths,
  pastYear;

  bool containsDate(DateTime date) {
    final startDate = range.startDate;
    final endDate = range.endDate;
    return date.isBefore(endDate) &&
        (date.isAfter(startDate) || date.isAtSameMomentAs(startDate));
  }

  ({DateTime startDate, DateTime endDate}) get range {
    final now = DateTime.now();
    switch (this) {
      case LogPeriodType.today:
        return (
          startDate: DateTime(now.year, now.month, now.day),
          endDate: DateTime(now.year, now.month, now.day + 1)
        );
      case LogPeriodType.pastWeek:
        return (
          startDate: DateTime(now.year, now.month, now.day - 6),
          endDate: DateTime(now.year, now.month, now.day + 1)
        );
      case LogPeriodType.pastMonth:
        return (
          startDate: DateTime(now.year, now.month),
          endDate: DateTime(now.year, now.month + 1)
        );
      case LogPeriodType.pastSixMonths:
        return (
          startDate: DateTime(now.year, now.month - 5),
          endDate: DateTime(now.year, now.month + 1)
        );
      case LogPeriodType.pastYear:
        return (
          startDate: DateTime(now.year, now.month - 11),
          endDate: DateTime(now.year, now.month + 1)
        );
    }
  }
}