import 'package:characters/characters.dart';
import 'package:dict_app/models/data_tree/dict_data/transcript_model.dart'; // Assuming this path is correct
import 'package:dict_app/utils/utils.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dictation_data_model.g.dart';

@JsonSerializable()
@embedded
class DictationSection {
  DictationSection({
    this.paragraphs,
    this.index,
    this.parentIndex,
  });

  List<DictationParagraph>? paragraphs;
  int? index;
  int? parentIndex;

  bool get isCompleted =>
      paragraphs?.map((e) => e.isCompleted).where((e) => e == false).isEmpty ??
      true;

  String get displayText =>
      paragraphs?.map((e) => e.displayText).join(' ') ?? '';

  static DictationSection from({
    required Paragraphs paragraphs,
    int? index,
    int? parentIndex,
    bool alphabetOnly = true,
  }) {
    if (paragraphs.paragraphs == null) {
      return DictationSection(paragraphs: [], index: index, parentIndex: parentIndex);
    }
    final ps = paragraphs.paragraphs!
        .indexed
        .map((t) => DictationParagraph.from(
          index: t.$1,
          parentIndex: 0, // Section is top level, so parent index within paragraphs should be zero.
          paragraph: t.$2,
          alphabetOnly: alphabetOnly,
    ))
        .toList();
    return DictationSection(paragraphs: ps, index: index, parentIndex: parentIndex);
  }

  DictationSection copyWith({
    List<DictationParagraph>? paragraphs,
    int? index,
    int? parentIndex,
  }) {
    return DictationSection(
      paragraphs: paragraphs ?? this.paragraphs,
      index: index ?? this.index,
      parentIndex: parentIndex ?? this.parentIndex,
    );
  }

  DictationSection tryCharacter({
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

  DictationSection reset({bool alphabetOnly = true}) {
    final newList =
        paragraphs?.map((p) => p.reset(alphabetOnly: alphabetOnly)).toList();
    return copyWith(paragraphs: newList);
  }

  DictationSection resetParagraph({required int paragraphIndex}) {
    if (paragraphs == null || paragraphIndex >= paragraphs!.length) return this;

    final target = paragraphs![paragraphIndex];

    final newList = List<DictationParagraph>.from(paragraphs!);
    newList[paragraphIndex] = target.reset();

    return copyWith(paragraphs: newList);
  }

  DictationSection resetSentence(
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

  DictationSection resetWord(
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

  factory DictationSection.fromJson(Map<String, dynamic> json) =>
      _$DictationSectionFromJson(json);

  Map<String, dynamic> toJson() => _$DictationSectionToJson(this);
}

@JsonSerializable()
@embedded
class DictationParagraph {
  DictationParagraph({
    this.index,
    this.parentIndex,
    this.sentences,
    this.start,
    this.end,
  });

  int? index;
  int? parentIndex;
  List<DictationSentence>? sentences;
  double? start;
  double? end;

  bool get isCompleted =>
      sentences?.map((e) => e.isCompleted).where((e) => e == false).isEmpty ??
      true;

  String get displayText =>
      sentences?.map((e) => e.displayText).join(' ') ?? '';

  static DictationParagraph from({
    required int index, 
    required int parentIndex,
    required Paragraph paragraph,
    bool alphabetOnly = true,
  }) {
    if (paragraph.sentences == null ||
        paragraph.start == null ||
        paragraph.end == null) {
      return DictationParagraph(sentences: [], start: 0, end: 0, index: index, parentIndex: parentIndex);
    }
    final sentences = paragraph.sentences!
        .indexed
        .map((t) => DictationSentence.from(
          index: t.$1,
          parentIndex: index,
          sentence: t.$2,
          alphabetOnly: alphabetOnly,
    ))
        .toList();
    return DictationParagraph(
        index: index,
        parentIndex: parentIndex,
        sentences: sentences,
        start: paragraph.start!,
        end: paragraph.end!);
  }

  DictationParagraph copyWith({
    int? index,
    int? parentIndex,
    List<DictationSentence>? sentences,
    double? start,
    double? end,
  }) {
    return DictationParagraph(
      index: index ?? this.index,
      parentIndex: parentIndex ?? this.parentIndex,
      sentences: sentences ?? this.sentences,
      start: start ?? this.start,
      end: end ?? this.end,
    );
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
    this.index,
    this.parentIndex,
    this.sentence,
    this.words,
    this.start,
    this.end,
  });

  int? index;
  int? parentIndex;
  String? sentence;
  List<DictationWord>? words;
  double? start;
  double? end;

  bool get isCompleted =>
      words?.map((e) => e.isCompleted).where((e) => e == false).isEmpty ?? true;

  String get displayText => words?.map((e) => e.displayText).join(' ') ?? '';

  static DictationSentence from({
    required int index,
    required int parentIndex,
    required Sentence sentence,
    bool alphabetOnly = true,
  }) {
    if (sentence.text == null ||
        sentence.start == null ||
        sentence.end == null) {
      return DictationSentence(
        index: index,
        parentIndex: parentIndex,
        sentence: '',
        words: [],
        start: 0,
        end: 0,
      );
    }
    final words = sentence.text!
        .split(' ')
        .indexed
        .map((t) => DictationWord.from(
              index: t.$1,
              parentIndex: index,
              word: t.$2,
              alphabetOnly: alphabetOnly,
              start: 0,
              end: 0,
          ))
        .toList();
    return DictationSentence(
      index: index,
      parentIndex: parentIndex,
      sentence: sentence.text!,
      words: words,
      start: sentence.start!,
      end: sentence.end!,
    );
  }

  DictationSentence copyWith({
    int? index,
    int? parentIndex,
    String? sentence,
    List<DictationWord>? words,
    double? start,
    double? end,
  }) {
    return DictationSentence(
      index: index ?? this.index,
      parentIndex: parentIndex ?? this.parentIndex,
      sentence: sentence ?? this.sentence,
      words: words ?? this.words,
      start: start ?? this.start,
      end: end ?? this.end,
    );
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
    this.index,
    this.parentIndex,
    this.word,
    this.characters,
    this.start,
    this.end,
  });

  int? index;
  int? parentIndex;
  String? word;
  List<DictationCharacter>? characters;
  double? start;
  double? end;

  bool get isCompleted =>
      characters?.map((e) => e.isSolved).where((e) => e == false).isEmpty ??
      true;

  String get displayText => characters?.map((e) => e.character).join() ?? '';

  static DictationWord from({
    required int index,
    required int parentIndex,
    required String word,
    bool alphabetOnly = true,
    required double start,
    required double end,
  }) {
    return DictationWord(
      index: index,
      parentIndex: parentIndex,
      word: word,
      characters: word.characters
          .toList()
          .indexed
          .map((t) => DictationCharacter.from(
                index: t.$1,
                parentIndex: index,
                character: t.$2,
                alphabetOnly: alphabetOnly,
              ))
          .toList(),
      start: start,
      end: end,
    );
  }

  DictationWord copyWith({
    int? index,
    int? parentIndex,
    String? word,
    List<DictationCharacter>? characters,
    double? start,
    double? end,
  }) {
    return DictationWord(
      index: index ?? this.index,
      parentIndex: parentIndex ?? this.parentIndex,
      word: word ?? this.word,
      characters: characters ?? this.characters,
      start: start ?? this.start,
      end: end ?? this.end,
    );
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
    this.index,
    this.parentIndex,
    this.character,
    this.isSolved = false,
  });

  int? index;
  int? parentIndex;
  String? character;
  bool isSolved;

  static DictationCharacter from({
    required int index,
    required int parentIndex,
    required String character,
    bool alphabetOnly = true,
  }) {
    return DictationCharacter(
      index: index,
      parentIndex: parentIndex,
      character: character,
      isSolved: alphabetOnly ? !isAlphabet(character) : false,
    );
  }

  DictationCharacter copyWith({
    int? index,
    int? parentIndex,
    String? character,
    bool? isSolved,
  }) {
    return DictationCharacter(
      index: index ?? this.index,
      parentIndex: parentIndex ?? this.parentIndex,
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