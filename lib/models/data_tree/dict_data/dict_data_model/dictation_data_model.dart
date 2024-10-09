import 'package:dict_app/models/data_tree/dict_data/transcript_model.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:characters/characters.dart';

part 'dictation_data_model.g.dart';

@JsonSerializable()
class DictationParagraph {
  const DictationParagraph(
      {required this.sentences, required this.start, required this.end});

  final List<DictationSentence> sentences;

  final double start;
  final double end;

  bool get isCompleted =>
      sentences.map((e) => e.isCompleted).where((e) => e == false).isEmpty;

  String get displayText => sentences.map((e) => e.displayText).join(' ');

  factory DictationParagraph.from({
    required Paragraph paragraph,
    bool alphabetOnly = true,
  }) {
    if (paragraph.sentences == null ||
        paragraph.start == null ||
        paragraph.end == null) {
      return DictationParagraph(sentences: [], start: 0, end: 0);
    }
    final sentences = paragraph.sentences!
        .map((sentence) => DictationSentence.from(
            sentence: sentence, alphabetOnly: alphabetOnly))
        .toList();
    return DictationParagraph(
        sentences: sentences, start: paragraph.start!, end: paragraph.end!);
  }

  DictationParagraph copyWith(
      {List<DictationSentence>? sentences, double? start, double? end}) {
    return DictationParagraph(
        sentences: sentences ?? this.sentences,
        start: start ?? this.start,
        end: end ?? this.end);
  }

  DictationParagraph tryCharacter({required String input,required int sentenceIndex,required int wordIndex,bool solveAnyway = false}) {
    if (isCompleted) return this;
    
    if (sentences.elementAtOrNull(sentenceIndex) == null) return this;
    final updatedSentence = sentences[sentenceIndex].tryCharacter(input: input,wordIndex: wordIndex,solveAnyway: solveAnyway);
    return copyWith(
      sentences: [
        ...sentences.sublist(0, wordIndex),
        updatedSentence,
        ...sentences.sublist(wordIndex + 1),
      ],
    );
  }

  factory DictationParagraph.fromJson(Map<String, dynamic> json) =>
      _$DictationParagraphFromJson(json);
  Map<String, dynamic> toJson() => _$DictationParagraphToJson(this);
}

@JsonSerializable()
class DictationSentence {
  const DictationSentence(
      {required this.sentence,
      required this.words,
      required this.start,
      required this.end});

  final String sentence;
  final List<DictationWord> words;

  final double start;
  final double end;

  bool get isCompleted =>
      words.map((e) => e.isCompleted).where((e) => e == false).isEmpty;

  String get displayText => words.map((e) => e.displayText).join(' ');

  factory DictationSentence.from({
    required Sentence sentence,
    bool alphabetOnly = true,
  }) {
    if (sentence.text == null ||
        sentence.start == null ||
        sentence.end == null) {
      return DictationSentence(sentence: '', words: [], start: 0, end: 0);
    }
    final words = sentence.text!
        .split(' ')
        .map((word) => DictationWord.from(
            word: word, alphabetOnly: alphabetOnly, start: 0, end: 0))
        .toList();
    return DictationSentence(
        sentence: sentence.text!,
        words: words,
        start: sentence.start!,
        end: sentence.end!);
  }

  DictationSentence copyWith(
      {String? sentence,
      List<DictationWord>? words,
      double? start,
      double? end}) {
    return DictationSentence(
        sentence: sentence ?? this.sentence,
        words: words ?? this.words,
        start: start ?? this.start,
        end: end ?? this.end);
  }

  DictationSentence tryCharacter(
      {required String input, required int wordIndex, bool solveAnyway = false}) {
    if (isCompleted) return this;

    if (words.elementAtOrNull(wordIndex) == null) return this;
    final updatedWord = words[wordIndex].tryCharacter(input: input,solveAnyway: solveAnyway);
    return copyWith(
      words: [
        ...words.sublist(0, wordIndex),
        updatedWord,
        ...words.sublist(wordIndex + 1),
      ],
    );
  }

  factory DictationSentence.fromJson(Map<String, dynamic> json) =>
      _$DictationSentenceFromJson(json);
  Map<String, dynamic> toJson() => _$DictationSentenceToJson(this);
}

@JsonSerializable()
class DictationWord {
  const DictationWord(
      {required this.word, required this.characters, this.start, this.end});

  final String word;
  final List<DictationCharacter> characters;

  final double? start;
  final double? end;

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

  DictationWord tryCharacter(
      {required String input, bool solveAnyway = false}) {
    if (isCompleted) return this;
    final firstUnsolvedIndex = characters.indexWhere((e) => !e.isSolved);
    final firstUnsolvedCharacter = characters[firstUnsolvedIndex];

    if (solveAnyway ||
        characters[firstUnsolvedIndex].character.toLowerCase() ==
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
