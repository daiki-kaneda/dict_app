import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_entry.g.dart';

enum Result{
  // Order of this values must not be changed because of EnumType.ordinal
  success,failure,usedHint;
}

@collection
@JsonSerializable()
class LogEntry {
  LogEntry({
    required this.date,
    required this.fileId,
    required this.result
  });

  Id id = Isar.autoIncrement;
  final DateTime date;
  final int fileId;
  // Stores the index of the enum as a byte value.
  @Enumerated(EnumType.ordinal)
  final Result result;
}