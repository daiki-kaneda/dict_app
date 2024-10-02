import 'package:characters/characters.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dictation_sentence_problem.g.dart';

@JsonSerializable()
class DictationSentenceProblem {
  const DictationSentenceProblem({
    required this.sentence,
    required this.characters,
  });

  final String sentence;
  final List<DictationCharacter> characters;

  bool get isCompleted => characters.map((e) => e.isSolved).where((e) => e == false).isEmpty;

  String get displayText => characters.map((e) => e.character).join();

  factory DictationSentenceProblem.from(
      {required String sentence, bool alphabetOnly = true}) {
    return DictationSentenceProblem(
        sentence: sentence,
        characters: sentence.characters.toList().map((c) => DictationCharacter.from(character: c, alphabetOnly: alphabetOnly)).toList());
  }

  DictationSentenceProblem copyWith({
    String? sentence,
    List<DictationCharacter>? characters,
  }) {
    return DictationSentenceProblem(
      sentence: sentence ?? this.sentence,
      characters: characters ?? this.characters,
    );
  }

  DictationSentenceProblem tryCharacter({required String input}) {
    if (isCompleted) return this;
    final firstUnsolvedIndex = characters.indexWhere((e) => !e.isSolved);
    final firstUnsolvedCharacter = characters[firstUnsolvedIndex];

    if (characters[firstUnsolvedIndex].character.toLowerCase() ==
        input.toLowerCase()) {
      characters[firstUnsolvedIndex] = firstUnsolvedCharacter.copyWith(
          isSolved: true);

      return this;
    } else {
      return this;
    }
  }

  factory DictationSentenceProblem.fromJson(Map<String, dynamic> json) =>
      _$DictationSentenceProblemFromJson(json);

  Map<String, dynamic> toJson() => _$DictationSentenceProblemToJson(this);
}

@JsonSerializable()
class DictationCharacter {
  const DictationCharacter({
    required this.character,
    this.isSolved = false,
  });
  final String character;
  final bool isSolved;

  // if alphabetOnly is true and character is not alphabet,the character will be set sloved initially.
  factory DictationCharacter.from({
    required String character,
    bool alphabetOnly = true,
  }) {
    return DictationCharacter(
        character: character,
        isSolved: alphabetOnly ? !isAlphabet(character) : false);
  }

  DictationCharacter copyWith({
    String? character,
    bool? isSolved,
  }) {
    return DictationCharacter(
      character: character ?? this.character,
      isSolved: isSolved ?? this.isSolved,
    );
  }

  DictationCharacter toggleIsSolved() {
    return copyWith(isSolved: !isSolved);
  }

  factory DictationCharacter.fromJson(Map<String, dynamic> json) =>
      _$DictationCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$DictationCharacterToJson(this);
}