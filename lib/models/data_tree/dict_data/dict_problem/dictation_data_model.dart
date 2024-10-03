import 'package:dict_app/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:characters/characters.dart';

part 'dictation_data_model.g.dart';

// @JsonSerializable()
// class DictationSentence {
//   const DictationSentence(
//       {required this.sentence, required this.words,
//       required this.start,required this.end});

//   final String sentence;
//   final List<DictationWord> words;

//   final double start;
//   final double end;

//   bool get isCompleted =>
//       words.map((e) => e.isCompleted).where((e) => e == false).isEmpty;

//   String get displayText => words.map((e) => e.displayText).join(' ');

//   factory DictationSentence.from({
//     required Sentence sentence,
//     bool alphabetOnly = true,
//   }) {
//     if(sentence.text==null||sentence.start==null||sentence.end==null){
//       return DictationSentence(sentence: '', words: [], start: 0, end: 0);
//     }
//     final words = sentence.text!
//         .split(' ')
//         .map((word) => DictationWord.from(word: word, alphabetOnly: alphabetOnly))
//         .toList();
//     return DictationSentence(sentence: sentence.text!, words: words,start: sentence.start!,end: sentence.end! );
//   }

//   DictationSentence copyWith({
//     String? sentence,
//     List<DictationWord>? words,
//     double? start,
//     double? end
//   }) {
//     return DictationSentence(
//       sentence: sentence ?? this.sentence,
//       words: words ?? this.words,
//       start: start ?? this.start,
//       end: end ?? this.end
//     );
//   }

//   DictationSentence tryCharacter({required String input}) {
//     if (isCompleted) return this;
//     for (var i = 0; i < words.length; i++) {
//       if (!words[i].isCompleted) {
//         final updatedWord = words[i].tryCharacter(input: input);
//         return copyWith(
//           words: [
//             ...words.sublist(0, i),
//             updatedWord,
//             ...words.sublist(i + 1),
//           ],
//         );
//       }
//     }
//     return this;
//   }

//   factory DictationSentence.fromJson(Map<String, dynamic> json) =>
//       _$DictationSentenceFromJson(json);
//   Map<String, dynamic> toJson() => _$DictationSentenceToJson(this);
// }

@JsonSerializable()
class DictationWord {
  const DictationWord(
      {required this.word,
      required this.characters,
      required this.start,
      required this.end});

  final String word;
  final List<DictationCharacter> characters;

  final double start;
  final double end;

  bool get isCompleted =>
      characters.map((e) => e.isSolved).where((e) => e == false).isEmpty;

  String get displayText => characters.map((e) => e.character).join();

  factory DictationWord.from(
      {required String word,
      bool alphabetOnly = true,
      required double start,
      required double end}) {
    return DictationWord(
        word: word,
        characters: word.characters
            .toList()
            .map(
              (c) => DictationCharacter.from(
                character: c,
                alphabetOnly: alphabetOnly,
              ),
            )
            .toList(),
        start: start,
        end: end);
  }

  DictationWord copyWith(
      {String? word,
      List<DictationCharacter>? characters,
      double? start,
      double? end}) {
    return DictationWord(
        word: word ?? this.word,
        characters: characters ?? this.characters,
        start: start ?? this.start,
        end: end ?? this.end);
  }

  DictationWord tryCharacter({required String input,bool solveAnyway = false}) {
    if (isCompleted) return this;
    final firstUnsolvedIndex = characters.indexWhere((e) => !e.isSolved);
    final firstUnsolvedCharacter = characters[firstUnsolvedIndex];

    if (solveAnyway || characters[firstUnsolvedIndex].character.toLowerCase() ==
        input.toLowerCase()) {
      characters[firstUnsolvedIndex] =
          firstUnsolvedCharacter.copyWith(isSolved: true);

      return this;
    } else {
      return this;
    }
  }

  DictationWord updateIsSolved(bool target, {bool alphabetOnly = true}) {
    return copyWith(
        characters: characters
            .map((c) => c.updateIsSolved(target, alphabetOnly: alphabetOnly))
            .toList());
  }

  factory DictationWord.fromJson(Map<String, dynamic> json) =>
      _$DictationWordFromJson(json);
  Map<String, dynamic> toJson() => _$DictationWordToJson(this);
}

@JsonSerializable()
class DictationCharacter {
  const DictationCharacter({required this.character, this.isSolved = false});
  final String character;
  final bool isSolved;

  factory DictationCharacter.from({
    required String character,
    bool alphabetOnly = true,
  }) {
    return DictationCharacter(
      character: character,
      isSolved: alphabetOnly ? !isAlphabet(character) : false,
    );
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

  DictationCharacter updateIsSolved(bool target, {bool alphabetOnly = true}) {
    if (!isAlphabet(character)) return this;
    return copyWith(isSolved: target);
  }

  factory DictationCharacter.fromJson(Map<String, dynamic> json) =>
      _$DictationCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$DictationCharacterToJson(this);
}
