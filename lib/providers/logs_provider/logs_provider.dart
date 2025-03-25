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

  addLogEntry(
      {required int fileId, required AnswerResult result}) {
    final newLogEntry = LogEntry(date: DateTime.now(), fileId: fileId, result: result);
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
  LogPeriod build() {
    return LogPeriod.today();
  }

  update(LogPeriod newPeriod){
    state = newPeriod;
  }
}

@riverpod
List<LogEntry> filteredLogs(FilteredLogsRef ref) {
  final period = ref.watch(logsFilterOptionProvider);
  final logs = ref.watch(logsProvider);
  return logs.where((e)=>period.containsDate(e.date)).toList();
}

enum LogPeriodType {
  today,
  pastWeek,
  pastMonth,
  pastSixMonths,
  pastYear,
  custom,
}

class LogPeriod {
  final LogPeriodType type;
  final DateTime startDate;
  final DateTime endDate;

  static final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  LogPeriod._({required this.type, required this.startDate, required this.endDate});

  factory LogPeriod.today() {
    final now = DateTime.now();
    return LogPeriod._(
      type: LogPeriodType.today,
      startDate: DateTime(now.year, now.month, now.day),
      endDate: DateTime(now.year, now.month, now.day, 23, 59, 59),
    );
  }

  factory LogPeriod.pastWeek() => _getRangeFromNow(LogPeriodType.pastWeek, days: 6);
  factory LogPeriod.pastMonth() => _getRangeFromNow(LogPeriodType.pastMonth, months: 1);
  factory LogPeriod.pastSixMonths() => _getRangeFromNow(LogPeriodType.pastSixMonths, months: 6);
  factory LogPeriod.pastYear() => _getRangeFromNow(LogPeriodType.pastYear, years: 1);

  factory LogPeriod.custom({required DateTime startDate, required DateTime endDate}) {
    assert(startDate.isBefore(endDate) || startDate.isAtSameMomentAs(endDate),
        'startDate must be before or equal to endDate.');
    return LogPeriod._(
      type: LogPeriodType.custom,
      startDate: DateTime(startDate.year, startDate.month, startDate.day),
      endDate: DateTime(endDate.year, endDate.month, endDate.day, 23, 59, 59),
    );
  }

  static LogPeriod _getRangeFromNow(LogPeriodType type, {int days = 0, int months = 0, int years = 0}) {
    final now = DateTime.now();
    final endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
    final startDate = DateTime(now.year - years, now.month - months, now.day - days);
    return LogPeriod._(type: type, startDate: startDate, endDate: endDate);
  }

  String get startDateString => _dateFormat.format(startDate);
  String get endDateString => _dateFormat.format(endDate);

  @override
  String toString() {
    switch (type) {
      case LogPeriodType.today:
        return '今日: $startDateString';
      case LogPeriodType.pastWeek:
        return '過去1週間: $startDateString - $endDateString';
      case LogPeriodType.pastMonth:
        return '過去1ヶ月: $startDateString - $endDateString';
      case LogPeriodType.pastSixMonths:
        return '過去6ヶ月: $startDateString - $endDateString';
      case LogPeriodType.pastYear:
        return '過去1年: $startDateString - $endDateString';
      case LogPeriodType.custom:
        return 'カスタム: $startDateString - $endDateString';
    }
  }

  bool containsDate(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return startDate.isBefore(dateOnly.add(const Duration(days: 1))) &&
           endDate.isAfter(dateOnly.subtract(const Duration(days: 1)));
  }
}
