import 'package:dict_app/models/data_tree/dictation_data_model/dictation_data_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'log_entry.g.dart';

@collection
@JsonSerializable()
class LogEntry {
  LogEntry({required this.date, required this.fileId, required this.result});

  Id id = Isar.autoIncrement;
  @Index()
  final DateTime date;
  final int fileId;
  final AnswerResult result;

  factory LogEntry.fromJson(Map<String, dynamic> json) =>
      _$LogEntryFromJson(json);
  Map<String, dynamic> toJson() => _$LogEntryToJson(this);
}
