import 'package:characters/characters.dart';
import 'package:dict_app/models/data_tree/dict_data/transcript_model.dart'; // Assuming this path is correct
import 'package:dict_app/utils/utils.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dictation_data_model.g.dart';

@JsonSerializable()
@embedded
class DictationParagraphs {
  DictationParagraphs({
    this.paragraphs,
  });

  List<DictationParagraph>? paragraphs;

  bool get isCompleted =>
      paragraphs?.map((e) => e.isCompleted).where((e) => e == false).isEmpty ??
      true;

  String get displayText =>
      paragraphs?.map((e) => e.displayText).join(' ') ?? '';

  static DictationParagraphs from({
    required Paragraphs paragraphs,
    bool alphabetOnly = true,
  }) {
    if (paragraphs.paragraphs == null) {
      return DictationParagraphs(paragraphs: []);
    }
    final ps = paragraphs.paragraphs!
        .map((paragraph) => DictationParagraph.from(
            paragraph: paragraph, alphabetOnly: alphabetOnly))
        .toList();
    return DictationParagraphs(paragraphs: ps);
  }

  DictationParagraphs copyWith({List<DictationParagraph>? paragraphs}) {
    return DictationParagraphs(paragraphs: paragraphs ?? this.paragraphs);
  }

  DictationParagraphs tryCharacter({
    required String input,
    required int paragraphIndex,
    required int sentenceIndex,
    required int wordIndex,
    bool solveAnyway = false,
  }) {
    if (isCompleted) return this;

    if (paragraphs == null || paragraphIndex >= paragraphs!.length) return this;

    final updateParagraph = paragraphs![paragraphIndex].tryCharacter(
        input: input,
        sentenceIndex: sentenceIndex,
        wordIndex: wordIndex,
        solveAnyway: solveAnyway);

    final newList = List<DictationParagraph>.from(paragraphs!);
    newList[paragraphIndex] = updateParagraph;

    return copyWith(paragraphs: newList);
  }

  DictationParagraphs reset({bool alphabetOnly = true}) {
    final newList =
        paragraphs?.map((p) => p.reset(alphabetOnly: alphabetOnly)).toList();
    return copyWith(paragraphs: newList);
  }

  DictationParagraphs resetParagraph({required int paragraphIndex}) {
    if (paragraphs == null || paragraphIndex >= paragraphs!.length) return this;

    final target = paragraphs![paragraphIndex];

    final newList = List<DictationParagraph>.from(paragraphs!);
    newList[paragraphIndex] = target.reset();

    return copyWith(paragraphs: newList);
  }

  DictationParagraphs resetSentence(
      {required int paragraphIndex, required int sentenceIndex}) {
    if (paragraphs == null || paragraphIndex >= paragraphs!.length) return this;
    final targetParagraph = paragraphs![paragraphIndex];

    if (targetParagraph.sentences == null ||
        sentenceIndex >= targetParagraph.sentences!.length) return this;
    final targetSentence = targetParagraph.sentences![sentenceIndex];

    final newSentences =
        List<DictationSentence>.from(targetParagraph.sentences!);
    newSentences[sentenceIndex] = targetSentence.reset();

    final newList = List<DictationParagraph>.from(paragraphs!);
    newList[paragraphIndex] = targetParagraph.copyWith(sentences: newSentences);

    return copyWith(paragraphs: newList);
  }

  DictationParagraphs resetWord(
      {required int paragraphIndex,
      required int sentenceIndex,
      required int wordIndex}) {
    if (paragraphs == null || paragraphIndex >= paragraphs!.length) return this;
    final targetParagraph = paragraphs![paragraphIndex];

    if (targetParagraph.sentences == null ||
        sentenceIndex >= targetParagraph.sentences!.length) return this;
    final targetSentence = targetParagraph.sentences![sentenceIndex];

    if (targetSentence.words == null ||
        wordIndex >= targetSentence.words!.length) return this;
    final targetWord = targetSentence.words![wordIndex];

    final newWords = List<DictationWord>.from(targetSentence.words!);
    newWords[wordIndex] = targetWord.updateIsSolved(false);

    final newSentences =
        List<DictationSentence>.from(targetParagraph.sentences!);
    newSentences[sentenceIndex] = targetSentence.copyWith(words: newWords);

    final newList = List<DictationParagraph>.from(paragraphs!);
    newList[paragraphIndex] = targetParagraph.copyWith(sentences: newSentences);

    return copyWith(paragraphs: newList);
  }

  List<DictationSentence>? get getAllSentences =>
      paragraphs?.map((p) => p.sentences ?? []).toList().concat();

  factory DictationParagraphs.fromJson(Map<String, dynamic> json) =>
      _$DictationParagraphsFromJson(json);

  Map<String, dynamic> toJson() => _$DictationParagraphsToJson(this);
}

@JsonSerializable()
@embedded
class DictationParagraph {
  DictationParagraph({
    this.sentences,
    this.start,
    this.end,
  });

  List<DictationSentence>? sentences;
  double? start;
  double? end;

  bool get isCompleted =>
      sentences?.map((e) => e.isCompleted).where((e) => e == false).isEmpty ??
      true;

  String get displayText =>
      sentences?.map((e) => e.displayText).join(' ') ?? '';

  static DictationParagraph from({
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

  DictationParagraph tryCharacter(
      {required String input,
      required int sentenceIndex,
      required int wordIndex,
      bool solveAnyway = false}) {
    if (isCompleted) return this;
    if (sentences == null || sentenceIndex >= sentences!.length) return this;

    final updatedSentence = sentences![sentenceIndex].tryCharacter(
        input: input, wordIndex: wordIndex, solveAnyway: solveAnyway);

    final newList = List<DictationSentence>.from(sentences!);
    newList[sentenceIndex] = updatedSentence;

    return copyWith(sentences: newList);
  }

  DictationParagraph reset({bool alphabetOnly = true}) {
    final newList =
        sentences?.map((p) => p.reset(alphabetOnly: alphabetOnly)).toList();
    return copyWith(sentences: newList);
  }

  factory DictationParagraph.fromJson(Map<String, dynamic> json) =>
      _$DictationParagraphFromJson(json);
  Map<String, dynamic> toJson() => _$DictationParagraphToJson(this);
}

@JsonSerializable()
@embedded
class DictationSentence {
  DictationSentence({
    this.sentence,
    this.words,
    this.start,
    this.end,
  });

  String? sentence;
  List<DictationWord>? words;
  double? start;
  double? end;

  bool get isCompleted =>
      words?.map((e) => e.isCompleted).where((e) => e == false).isEmpty ?? true;

  String get displayText => words?.map((e) => e.displayText).join(' ') ?? '';

  static DictationSentence from({
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
      {required String input,
      required int wordIndex,
      bool solveAnyway = false}) {
    if (isCompleted) return this;

    if (words == null || wordIndex >= words!.length) return this;

    final updatedWord =
        words![wordIndex].tryCharacter(input: input, solveAnyway: solveAnyway);
    final newList = List<DictationWord>.from(words!);
    newList[wordIndex] = updatedWord;

    return copyWith(words: newList);
  }

  DictationSentence reset({bool alphabetOnly = true}) {
    final newList = words
        ?.map((p) => p.updateIsSolved(false, alphabetOnly: alphabetOnly))
        .toList();
    return copyWith(words: newList);
  }

  factory DictationSentence.fromJson(Map<String, dynamic> json) =>
      _$DictationSentenceFromJson(json);
  Map<String, dynamic> toJson() => _$DictationSentenceToJson(this);
}

@JsonSerializable()
@embedded
class DictationWord {
  DictationWord({
    this.word,
    this.characters,
    this.start,
    this.end,
  });

  String? word;
  List<DictationCharacter>? characters;
  double? start;
  double? end;

  bool get isCompleted =>
      characters?.map((e) => e.isSolved).where((e) => e == false).isEmpty ??
      true;

  String get displayText => characters?.map((e) => e.character).join() ?? '';

  static DictationWord from({
    required String word,
    bool alphabetOnly = true,
    required double start,
    required double end,
  }) {
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
      end: end,
    );
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
    if (characters == null || characters!.isEmpty) return this;

    final firstUnsolvedIndex = characters!.indexWhere((e) => !e.isSolved);
    if (firstUnsolvedIndex == -1) return this; // Already completed

    final firstUnsolvedCharacter = characters![firstUnsolvedIndex];

    final newList = List<DictationCharacter>.from(characters!);

    if (solveAnyway ||
        firstUnsolvedCharacter.character!.toLowerCase() ==
            input.toLowerCase()) {
      newList[firstUnsolvedIndex] =
          firstUnsolvedCharacter.copyWith(isSolved: true);
      return copyWith(characters: newList);
    } else {
      return this;
    }
  }

  DictationWord updateIsSolved(bool target, {bool alphabetOnly = true}) {
    final newList = characters
        ?.map((c) => c.updateIsSolved(target, alphabetOnly: alphabetOnly))
        .toList();
    return copyWith(characters: newList);
  }

  factory DictationWord.fromJson(Map<String, dynamic> json) =>
      _$DictationWordFromJson(json);
  Map<String, dynamic> toJson() => _$DictationWordToJson(this);
}

@JsonSerializable()
@embedded
class DictationCharacter {
  DictationCharacter({
    this.character,
    this.isSolved = false,
  });

  String? character;
  bool isSolved;

  static DictationCharacter from({
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
    if (character == null || !isAlphabet(character!)) return this;
    return copyWith(isSolved: target);
  }

  static bool isAlphabet(String char) {
    return char.toLowerCase() != char.toUpperCase();
  }

  factory DictationCharacter.fromJson(Map<String, dynamic> json) =>
      _$DictationCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$DictationCharacterToJson(this);
}
