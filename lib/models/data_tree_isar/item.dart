import 'package:dict_app/models/data_tree/dict_data/transcript_model.dart';
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

sealed class Item {}

@collection
@JsonSerializable()
class Folder extends Item {
  Folder({
    required this.parentId,
    required this.title,
    required this.createdAt,
  });

  Id id = Isar.autoIncrement;

  int? parentId;
  final String title;
  final DateTime createdAt;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  Map<String, dynamic> toJson() => _$FolderToJson(this);

  Folder copyWith({
    int? parentId,
    String? title,
    DateTime? createdAt,
  }) {
    return Folder(
      parentId: parentId ?? this.parentId,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

@Collection()
@JsonSerializable()
class File extends Item {
  Id id = Isar.autoIncrement;
  int? parentId;
  final String title;
  final DateTime createdAt;
  final String audioPath;
  final String? description;
  final bool isFavorite;
  final double duration;
  final String transcript;
  final DictationSection paragraphs;
  // final TranscriptModel? transcriptModel;

  List<DictationSentence>? get getAllSentences =>
      paragraphs.paragraphs?.map((p) => p.sentences ?? []).toList().concat();

  File({
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

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);

  factory File.from(TranscriptModel transcript,
      {required int? parentId,
      required String audioPath,
      required String title,
      String? description}) {
    final alternative =
        transcript.results?.channels?.firstOrNull?.alternatives?.firstOrNull;
    if (alternative == null) throw UnsupportedError('no result data');
    final paragraphs = alternative.paragraphs;
    if (paragraphs?.paragraphs?.isEmpty != false)
      throw UnsupportedError('audio do not have english audio');
    return File(
      parentId: parentId,
      title: title,
      createdAt: DateTime.now(),
      audioPath: audioPath,
      description: description ?? '',
      isFavorite: false,
      duration: transcript.metadata?.duration ?? 0,
      transcript: alternative.transcript ?? '',
      paragraphs: DictationSection.from(paragraphs: paragraphs!),
      // transcriptModel: transcript
    );
  }

  File copyWith({
    int? parentId,
    String? title,
    DateTime? createdAt,
    String? audioPath,
    String? description,
    bool? isFavorite,
    double? duration,
    String? transcript,
    DictationSection? paragraphs,
  }) {
    return File(
      parentId: parentId ?? this.parentId,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      audioPath: audioPath ?? this.audioPath,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      duration: duration ?? this.duration,
      transcript: transcript ?? this.transcript,
      paragraphs: paragraphs ?? this.paragraphs,
    );
  }
}
