import 'package:dict_app/models/data_tree/dict_data/transcript_model.dart';
import 'package:dict_app/models/data_tree_isar/dict_data/dictation_data_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dict_data.g.dart';

@Collection()
@JsonSerializable()
class DictData {
  Id id = Isar.autoIncrement;
  final int parentId;
  final String title;
  final DateTime createdAt;
  final String audioPath;
  final String? description;
  final bool isFavorite;
  final double duration;
  final String transcript;
  final DictationParagraphs paragraphs;
  // final TranscriptModel? transcriptModel;

  DictData({
    required this.parentId,
    required this.title,
    required this.createdAt,
    required this.audioPath,
    required this.description,
    required this.isFavorite,
    required this.duration,
    required this.transcript,
    required this.paragraphs,
    // this.transcriptModel
  });

  factory DictData.fromJson(Map<String, dynamic> json) =>
      _$DictDataFromJson(json);

  Map<String, dynamic> toJson() => _$DictDataToJson(this);

  factory DictData.from(TranscriptModel transcript,
      {required int parentId,
      required String audioPath,
      required String title,
      String? description}) {
    final alternative =
        transcript.results?.channels?.firstOrNull?.alternatives?.firstOrNull;
    if (alternative == null) throw UnsupportedError('no result data');
    final paragraphs = alternative.paragraphs;
    if (paragraphs?.paragraphs?.isEmpty != false)
      throw UnsupportedError('audio do not have english audio');
    return DictData(
      parentId: parentId,
      title: title,
      createdAt: DateTime.now(),
      audioPath: audioPath,
      description: description ?? '',
      isFavorite: false,
      duration: transcript.metadata?.duration ?? 0,
      transcript: alternative.transcript ?? '',
      paragraphs: DictationParagraphs.from(paragraphs: paragraphs!),
      // transcriptModel: transcript
    );
  }

  DictData copyWith(
      {int? parentId,
      String? title,
      DateTime? createdAt,
      String? audioPath,
      String? description,
      bool? isFavorite,
      double? duration,
      String? transcript,
      List<Word>? words,
      DictationParagraphs? paragraphs,
      TranscriptModel? transcriptModel}) {
    return DictData(
      parentId: parentId ?? this.parentId,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      audioPath: audioPath ?? this.audioPath,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      duration: duration ?? this.duration,
      transcript: transcript ?? this.transcript,
      paragraphs: paragraphs ?? this.paragraphs,
      // transcriptModel: transcriptModel ?? this.transcriptModel
    );
  }
}
