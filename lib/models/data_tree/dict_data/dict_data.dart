import 'package:dict_app/models/data_tree/dict_data/dict_problem/dictation_data_model.dart';
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
  final List<DictationWord> wordProblems;


  const DictData(
      {required this.title,
      required this.createdAt,
      required this.audioPath,
      required this.description,
      required this.isFavorite,
      required this.duration,
      required this.transcript,
      required this.wordProblems});

  factory DictData.fromJson(Map<String, dynamic> json) =>
      _$DictDataFromJson(json);

  Map<String, dynamic> toJson() => _$DictDataToJson(this);

  factory DictData.from(TranscriptModel transcript,
      {required String audioPath,
        required String title, String? description}) {
    final alternative =
        transcript.results?.channels?.firstOrNull?.alternatives?.firstOrNull;
     if (alternative == null) throw UnsupportedError('no result data');
    final words =  alternative.words;
    if(words==null || words.isEmpty)throw UnsupportedError('audio do not have english audio');
    return DictData(
        title: title,
        createdAt: transcript.metadata?.created ?? DateTime.now(),
        audioPath: audioPath,
        description: description ?? '',
        isFavorite: false,
        duration: transcript.metadata?.duration ?? 0,
        transcript: alternative.transcript ?? '',
        wordProblems: words.map(
          (e){
            if(e.word!=null && e.start!=null && e.end!=null){
              return DictationWord.from(word: e.word!, start: e.start!, end: e.end!);
            }else{
              return null;
            }
          }
        ).whereType<DictationWord>().toList());
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
    Paragraphs? paragraphs,
    List<DictationWord>? wordProblems
  }) {
    return DictData(
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      audioPath: audioPath ?? this.audioPath,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      duration: duration ?? this.duration,
      transcript: transcript ?? this.transcript,
      wordProblems: wordProblems ?? this.wordProblems
    );
  }
  

  
}