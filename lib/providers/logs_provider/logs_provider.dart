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
      {required DateTime date, required int fileId, required Result result}) {
    final newLogEntry = LogEntry(date: date, fileId: fileId, result: result);
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

@riverpod
int logsSize(LogsSizeRef ref) {
  final isar = ref.read(isarProvider).requireValue;
  final size = isar.logEntrys.getSizeSync();
  print('Size of logEntrys :$size');
  return isar.logEntrys.getSizeSync();
}

String formatBytes(int bytes, {int decimals = 2}) {
  if (bytes <= 0) return "0 B";

  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  int i = 0;
  double size = bytes.toDouble();

  while (size >= 1024 && i < suffixes.length - 1) {
    size /= 1024;
    i++;
  }

  final String formattedSize = (decimals == 0)
      ? NumberFormat("#,##0").format(size)
      : NumberFormat("#,##0.${"#" * decimals}").format(size); 

  return "$formattedSize ${suffixes[i]}";
}
