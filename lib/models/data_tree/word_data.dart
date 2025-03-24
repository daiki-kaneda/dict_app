import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'word_data.g.dart';
@JsonSerializable()
@embedded
class WordData {
  WordData({
    this.index,
    this.word,
    this.punctuatedWord,
    this.start,
    this.end,
  });

  int? index;
  String? word;
  String? punctuatedWord;
  double? start;
  double? end;

  static WordData from({
    required int index,
    required String word,
    required String punctuatedWord,
    required double start,
    required double end,
  }) {
    return WordData(
      index: index,
      word: word,
      punctuatedWord: punctuatedWord,
      start: start,
      end: end,
    );
  }

  WordData copyWith({
    int? index,
    String? word,
    String? punctuatedWord,
    double? start,
    double? end,
  }) {
    return WordData(
      index: index ?? this.index,
      word: word ?? this.word,
      punctuatedWord: punctuatedWord ?? this.punctuatedWord,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  factory WordData.fromJson(Map<String, dynamic> json) =>
      _$WordDataFromJson(json);
  Map<String, dynamic> toJson() => _$WordDataToJson(this);
}