import 'package:collection/collection.dart';
import 'package:dict_app/models/data_tree/dictation_data_model/transcript_model.dart';
import 'package:dict_app/models/data_tree/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/data_tree/word_data.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

sealed class Item {}

@collection
@JsonSerializable()
class Folder extends Item {
  Folder({
    this.id,
    required this.parentId,
    required this.title,
    required this.createdAt,
    required this.lastUpdatedAt,
  });

  Id? id;
  int? parentId;
  final String title;
  final DateTime createdAt;
  DateTime lastUpdatedAt;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  Map<String, dynamic> toJson() => _$FolderToJson(this);

  Folder copyWith({
    int? id,
    int? parentId,
    String? title,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
  }) {
    return Folder(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
    );
  }
}

@Collection()
@JsonSerializable()
class File extends Item {
  Id? id;
  int? parentId;
  final String title;
  final DateTime createdAt;
  final DateTime lastUpdatedAt;
  final String audioPath;
  final String? description;
  final bool isFavorite;
  final double duration;
  final String transcript;
  final DictationSection paragraphs;
  final List<WordData> words;
  // final TranscriptModel? transcriptModel;

  List<DictationSentence> get getAllSentences =>
      paragraphs.paragraphs.map((p) => p.sentences).toList().concat();

  File({
    this.id,
    required this.parentId,
    required this.title,
    required this.createdAt,
    required this.lastUpdatedAt,
    required this.audioPath,
    required this.description,
    required this.isFavorite,
    required this.duration,
    required this.transcript,
    required this.paragraphs,
    required this.words,
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
    final words = alternative.words;
    if (paragraphs?.paragraphs?.isEmpty != false || words?.isEmpty != false) {
      throw UnsupportedError('audio do not have english audio');
    }
    return File(
        parentId: parentId,
        title: title,
        createdAt: DateTime.now(),
        lastUpdatedAt: DateTime.now(),
        audioPath: audioPath,
        description: description ?? '',
        isFavorite: false,
        duration: transcript.metadata?.duration ?? 0,
        transcript: alternative.transcript ?? '',
        paragraphs: DictationSection.from(paragraphs: paragraphs!),
        words: words?.indexed
                .map((t) {
                  final w = t.$2;
                  return WordData(
                      index: t.$1,
                      word: w.word,
                      punctuatedWord: w.punctuatedWord,
                      start: w.start,
                      end: w.end);
                })
                .whereType<WordData>()
                .toList() ??
            []
        // transcriptModel: transcript
        );
  }

  File copyWith({
    int? id,
    int? parentId,
    String? title,
    DateTime? createdAt,
    DateTime? lastUpdatedAt,
    String? audioPath,
    String? description,
    bool? isFavorite,
    double? duration,
    String? transcript,
    DictationSection? paragraphs,
    List<WordData>? words,
  }) {
    return File(
        id: id ?? this.id,
        parentId: parentId ?? this.parentId,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
        lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
        audioPath: audioPath ?? this.audioPath,
        description: description ?? this.description,
        isFavorite: isFavorite ?? this.isFavorite,
        duration: duration ?? this.duration,
        transcript: transcript ?? this.transcript,
        paragraphs: paragraphs ?? this.paragraphs,
        words: words ?? this.words);
  }
}
