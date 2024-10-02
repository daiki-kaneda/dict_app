// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictation_sentence_problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DictationSentenceProblem _$DictationSentenceProblemFromJson(
        Map<String, dynamic> json) =>
    DictationSentenceProblem(
      sentence: json['sentence'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => DictationCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DictationSentenceProblemToJson(
        DictationSentenceProblem instance) =>
    <String, dynamic>{
      'sentence': instance.sentence,
      'characters': instance.characters.map((e) => e.toJson()).toList(),
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
