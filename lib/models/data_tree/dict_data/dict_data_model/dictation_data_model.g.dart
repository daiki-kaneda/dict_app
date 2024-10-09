// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictation_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictationParagraph _$DictationParagraphFromJson(Map<String, dynamic> json) =>
    DictationParagraph(
      sentences: (json['sentences'] as List<dynamic>)
          .map((e) => DictationSentence.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
    );

Map<String, dynamic> _$DictationParagraphToJson(DictationParagraph instance) =>
    <String, dynamic>{
      'sentences': instance.sentences.map((e) => e.toJson()).toList(),
      'start': instance.start,
      'end': instance.end,
    };

DictationSentence _$DictationSentenceFromJson(Map<String, dynamic> json) =>
    DictationSentence(
      sentence: json['sentence'] as String,
      words: (json['words'] as List<dynamic>)
          .map((e) => DictationWord.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
    );

Map<String, dynamic> _$DictationSentenceToJson(DictationSentence instance) =>
    <String, dynamic>{
      'sentence': instance.sentence,
      'words': instance.words.map((e) => e.toJson()).toList(),
      'start': instance.start,
      'end': instance.end,
    };

DictationWord _$DictationWordFromJson(Map<String, dynamic> json) =>
    DictationWord(
      word: json['word'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => DictationCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: (json['start'] as num?)?.toDouble(),
      end: (json['end'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DictationWordToJson(DictationWord instance) {
  final val = <String, dynamic>{
    'word': instance.word,
    'characters': instance.characters.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start', instance.start);
  writeNotNull('end', instance.end);
  return val;
}

DictationCharacter _$DictationCharacterFromJson(Map<String, dynamic> json) =>
    DictationCharacter(
      character: json['character'] as String,
      isSolved: json['isSolved'] as bool? ?? false,
    );

Map<String, dynamic> _$DictationCharacterToJson(DictationCharacter instance) =>
    <String, dynamic>{
      'character': instance.character,
      'isSolved': instance.isSolved,
    };
