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
      return DictationSection(
          paragraphs: [], index: index, parentIndex: parentIndex);
    }
    final ps = paragraphs.paragraphs!.indexed
        .map((t) => DictationParagraph.from(
              index: t.$1,
              parentIndex:
                  0, // Section is top level, so parent index within paragraphs should be zero.
              paragraph: t.$2,
              alphabetOnly: alphabetOnly,
            ))
        .toList();
    return DictationSection(
        paragraphs: ps, index: index, parentIndex: parentIndex);
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

  (DictationSection, AnswerResult) tryCharacter({
    required String input,
    required int paragraphIndex,
    required int sentenceIndex,
    required int wordIndex,
    bool solveAnyway = false,
  }) {
    if (isCompleted) return (this, AnswerResult());

    if (paragraphs == null || paragraphIndex >= paragraphs!.length) {
      return (this, AnswerResult());
    }

    final (updateParagraph, result) = paragraphs![paragraphIndex].tryCharacter(
        input: input,
        sentenceIndex: sentenceIndex,
        wordIndex: wordIndex,
        solveAnyway: solveAnyway);

    final newList = List<DictationParagraph>.from(paragraphs!);
    newList[paragraphIndex] = updateParagraph;

    final newSection = copyWith(paragraphs: newList);
    final newResult = result.copyWith(
        solveAnyway: solveAnyway,
        status:
            newSection.isCompleted ? SolveStatus.sectionSolved : result.status);
    return (newSection, newResult);
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
        sentenceIndex >= targetParagraph.sentences!.length) {
      return this;
    }
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
        sentenceIndex >= targetParagraph.sentences!.length) {
      return this;
    }
    final targetSentence = targetParagraph.sentences![sentenceIndex];

    if (targetSentence.words == null ||
        wordIndex >= targetSentence.words!.length) {
      return this;
    }
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

  int newestUnsolvedIndex() {
    if (paragraphs == null) return 0;
    final index = paragraphs!.indexWhere((p) => !(p.isCompleted));
    if (index == -1) return paragraphs!.length - 1;
    return index;
  }

  int get firstUnsolvedIndex =>
      paragraphs?.indexWhere((e) => !e.isCompleted) ?? -1;

  double get accuracy => allCharacters.isNotEmpty ?  allCharacters.map((c)=>c.accuracy).mean:0;
  List<DictationCharacter> get allCharacters => paragraphs?.expand<DictationCharacter>((p)=>p.allCharacters).toList() ?? [];

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
      return DictationParagraph(
          sentences: [],
          start: 0,
          end: 0,
          index: index,
          parentIndex: parentIndex);
    }
    final sentences = paragraph.sentences!.indexed
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

  int newestUnsolvedIndex() {
    if (sentences == null) return 0;
    final index = sentences!.indexWhere((p) => !(p.isCompleted));
    if (index == -1) return sentences!.length - 1;
    return index;
  }

  (DictationParagraph, AnswerResult) tryCharacter(
      {required String input,
      required int sentenceIndex,
      required int wordIndex,
      bool solveAnyway = false}) {
    if (isCompleted) return (this, AnswerResult());
    if (sentences == null || sentenceIndex >= sentences!.length) {
      return (this, AnswerResult());
    }

    final (updatedSentence, result) = sentences![sentenceIndex].tryCharacter(
        input: input, wordIndex: wordIndex, solveAnyway: solveAnyway);

    final newList = List<DictationSentence>.from(sentences!);
    newList[sentenceIndex] = updatedSentence;

    final newParagraph = copyWith(sentences: newList);
    final newResult = result.copyWith(
        solveAnyway: solveAnyway,
        status: newParagraph.isCompleted
            ? SolveStatus.paragraphSolved
            : result.status);

    return (newParagraph, newResult);
  }

  DictationParagraph reset({bool alphabetOnly = true}) {
    final newList =
        sentences?.map((p) => p.reset(alphabetOnly: alphabetOnly)).toList();
    return copyWith(sentences: newList);
  }

  int get firstUnsolvedIndex =>
      sentences?.indexWhere((e) => !e.isCompleted) ?? -1;
  
  double get accuracy => allCharacters.isNotEmpty ?  allCharacters.map((c)=>c.accuracy).mean:0;
  List<DictationCharacter> get allCharacters => sentences?.expand<DictationCharacter>((s)=>s.allCharacters).toList() ?? [];

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

  int newestUnsolvedIndex() {
    if (words == null) return 0;
    final index = words!.indexWhere((p) => !(p.isCompleted));
    if (index == -1) return words!.length - 1;
    return index;
  }

  (DictationSentence, AnswerResult) tryCharacter(
      {required String input,
      required int wordIndex,
      bool solveAnyway = false}) {
    if (isCompleted) return (this, AnswerResult());

    if (words == null || wordIndex >= words!.length) {
      return (this, AnswerResult());
    }

    final (updatedWord, result) =
        words![wordIndex].tryCharacter(input: input, solveAnyway: solveAnyway);
    final newList = List<DictationWord>.from(words!);
    newList[wordIndex] = updatedWord;
    final newSentence = copyWith(words: newList);
    final newResult = result.copyWith(
        status: newSentence.isCompleted
            ? SolveStatus.sentenceSolved
            : result.status,
        solveAnyway: solveAnyway);

    return (newSentence, newResult);
  }

  DictationSentence reset({bool alphabetOnly = true}) {
    final newList = words
        ?.map((p) => p.updateIsSolved(false, alphabetOnly: alphabetOnly))
        .toList();
    return copyWith(words: newList);
  }

  int get firstUnsolvedIndex => words?.indexWhere((e) => !e.isCompleted) ?? -1;

  double get accuracy => allCharacters.isNotEmpty ?  allCharacters.map((c)=>c.accuracy).mean:0;
  List<DictationCharacter> get allCharacters => words?.expand<DictationCharacter>((w)=>w.characters ?? []).toList() ?? [];

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

  int newestUnsolvedIndex() {
    if (characters == null) return 0;
    final index = characters!.indexWhere((p) => !(p.isSolved));
    if (index == -1) return characters!.length - 1;
    return index;
  }

  (DictationWord, AnswerResult) tryCharacter(
      {required String input, bool solveAnyway = false}) {
    final result = AnswerResult();
    if (isCompleted) return (this, result);
    if (characters == null || characters!.isEmpty) return (this, result);

    if (firstUnsolvedIndex == -1) return (this, result);

    final firstUnsolvedCharacter = characters![firstUnsolvedIndex];

    final newList = List<DictationCharacter>.from(characters!);

    if (solveAnyway ||
        firstUnsolvedCharacter.character!.toLowerCase() ==
            input.toLowerCase()) {
      newList[firstUnsolvedIndex] =
          firstUnsolvedCharacter.attempted(solved: true, usedHint: solveAnyway);
      final newWord = copyWith(characters: newList);
      final newResult = result.copyWith(
          status: newWord.isCompleted
              ? SolveStatus.wordSolved
              : SolveStatus.characterSolved,
          solveAnyway: solveAnyway);
      return (newWord, newResult);
    } else {
      newList[firstUnsolvedIndex] = firstUnsolvedCharacter.attempted();
      final newWord = copyWith(characters: newList);
      return (newWord, result);
    }
  }

  DictationWord updateIsSolved(bool target, {bool alphabetOnly = true}) {
    final newList = characters
        ?.map((c) => c.updateIsSolved(target, alphabetOnly: alphabetOnly))
        .toList();
    return copyWith(characters: newList);
  }

  int get firstUnsolvedIndex =>
      characters?.indexWhere((e) => !e.isSolved) ?? -1;

  double get accuracy => characters?.isNotEmpty == true
      ? (characters!.map((c) => c.accuracy)).mean
      : 0;

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
    this.attempts = 0,
    this.solvedCount = 0,
    this.solveWithHintCount = 0,
  });

  int? index;
  int? parentIndex;
  String? character;
  bool isSolved;
  int attempts;
  int solvedCount;
  int solveWithHintCount;

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

  DictationCharacter copyWith(
      {int? index,
      int? parentIndex,
      String? character,
      bool? isSolved,
      int? attempts,
      int? solvedCount,
      int? solveWithHintCount}) {
    return DictationCharacter(
        index: index ?? this.index,
        parentIndex: parentIndex ?? this.parentIndex,
        character: character ?? this.character,
        isSolved: isSolved ?? this.isSolved,
        attempts: attempts ?? this.attempts,
        solvedCount: solvedCount ?? this.solvedCount,
        solveWithHintCount: solveWithHintCount ?? this.solveWithHintCount);
  }

  DictationCharacter updateIsSolved(bool target, {bool alphabetOnly = true}) {
    if (character == null || !isAlphabet(character!)) return this;
    return copyWith(isSolved: target);
  }

  static bool isAlphabet(String char) {
    return char.toLowerCase() != char.toUpperCase();
  }

  double get accuracy =>
      ((solvedCount - solveWithHintCount) / attempts).clamp(0, 1);

  DictationCharacter attempted({bool solved = false, bool usedHint = false}) =>
      copyWith(
          attempts: attempts+1,
          isSolved: solved,
          solvedCount: solved ? solvedCount + 1 : solvedCount,
          solveWithHintCount:
              solved && usedHint ? solveWithHintCount + 1 : solveWithHintCount);

  factory DictationCharacter.fromJson(Map<String, dynamic> json) =>
      _$DictationCharacterFromJson(json);
  Map<String, dynamic> toJson() => _$DictationCharacterToJson(this);
}

enum SolveStatus {
  unSolved,
  characterSolved,
  wordSolved,
  sentenceSolved,
  paragraphSolved,
  sectionSolved,
}

class AnswerResult {
  const AnswerResult({
    this.status = SolveStatus.unSolved,
    this.solveAnyway = false,
  });

  final SolveStatus status;
  final bool solveAnyway;

  AnswerResult copyWith({
    SolveStatus? status,
    bool? solveAnyway,
  }) {
    return AnswerResult(
      status: status ?? this.status,
      solveAnyway: solveAnyway ?? this.solveAnyway,
    );
  }

  @override
  String toString() {
    return 'Response(status: ${status.name}, solveAnyway: $solveAnyway)';
  }
}
