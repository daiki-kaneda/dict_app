// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictation_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictationWord _$DictationWordFromJson(Map<String, dynamic> json) =>
    DictationWord(
      word: json['word'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => DictationCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
    );

Map<String, dynamic> _$DictationWordToJson(DictationWord instance) =>
    <String, dynamic>{
      'word': instance.word,
      'characters': instance.characters.map((e) => e.toJson()).toList(),
      'start': instance.start,
      'end': instance.end,
    };

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
