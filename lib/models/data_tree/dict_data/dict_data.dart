import 'package:dict_app/models/data_tree/dict_data/transcript_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dict_data.g.dart';

@JsonSerializable()
class DictData {
  final String title;
  final DateTime createdAt;
  final String audioPath;
  final String? description;
  final bool isFavorite;
  final double duration;
  final String transcript;
  final List<Word> words;
  final Paragraphs paragraph;

  const DictData(
      {required this.title,
      required this.createdAt,
      required this.audioPath,
      required this.description,
      required this.isFavorite,
      required this.duration,
      required this.transcript,
      required this.words,
      required this.paragraph});

  factory DictData.fromJson(Map<String, dynamic> json) =>
      _$DictDataFromJson(json);

  Map<String, dynamic> toJson() => _$DictDataToJson(this);

  factory DictData.from(TranscriptModel transcript,
      {required String audioPath,
        required String title, String? description}) {
    final alternative =
        transcript.results?.channels?.firstOrNull?.alternatives?.firstOrNull;
    if (alternative == null) throw UnsupportedError('no result data');
    return DictData(
        title: title,
        createdAt: transcript.metadata?.created ?? DateTime.now(),
        audioPath: audioPath,
        description: description ?? '',
        isFavorite: false,
        duration: transcript.metadata?.duration ?? 0,
        transcript: alternative.transcript ?? '',
        words: alternative.words ?? [],
        paragraph: alternative.paragraphs ?? Paragraphs ());
  }

  DictData copyWith({
    String? title,
    DateTime? createdAt,
    String? audioPath,
    String? description,
    bool? isFavorite,
    double? duration,
    String? transcript,
    List<Word>? words,
    Paragraphs? paragraph,
  }) {
    return DictData(
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      audioPath: audioPath ?? this.audioPath,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      duration: duration ?? this.duration,
      transcript: transcript ?? this.transcript,
      words: words ?? this.words.toList(),
      paragraph: paragraph ?? this.paragraph,
    );
  }
  

  
}