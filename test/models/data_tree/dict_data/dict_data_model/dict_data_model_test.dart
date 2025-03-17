// import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:characters/characters.dart';

// void main() {
//   var dictation = DictationSection(
//     paragraphs: [
//       DictationParagraph(
//         sentences: [
//           DictationSentence(
//             sentence: "Hello world.",
//             words: [
//               DictationWord.from(
//                 index: 0,
//                 parentIndex: 0,
//                 word: "Hello", 
//                 start: 0, 
//                 end: 1),
//               DictationWord.from(
//                 index: 1,
//                 parentIndex: 0,
//                 word: "world.", start: 1, end: 2),
//             ],
//             start: 0,
//             end: 2,
//           ),
//           DictationSentence(
//             sentence: "This is a test.",
//             words: [
//               DictationWord.from(
//                 index: 0,
//                 parentIndex: 1,
//                 word: "This", 
//                 start: 2, 
//                 end: 3),
//               DictationWord.from(
//                 index: 1,
//                 parentIndex: 1,
//                 word: "is", 
//                 start: 3, 
//                 end: 4),
//               DictationWord.from(
//                 index: 2,
//                 parentIndex: 1,
//                 word: "a", 
//                 start: 4, 
//                 end: 5),
//               DictationWord.from(
//                 index: 3,
//                 parentIndex: 1,
//                 word: "test.", 
//                 start: 5, 
//                 end: 6),
//             ],
//             start: 2,
//             end: 6,
//           ),
//         ],
//         start: 0,
//         end: 6,
//       ),
//     ],
//   );
//   group('tryCharacter test start', () {
//     test('correct input test', () {
//       void printCharacter(int index) {
//         print(dictation.paragraphs![0].sentences![0].words![1].characters![index]
//             .toJson());
//       }

//       final inputCharacters = 'world';
//       for (final c in inputCharacters.characters.toList().asMap().entries) {
//         printCharacter(c.key);
//         expect(
//             dictation
//                 .paragraphs![0].sentences![0].words![1].characters![c.key].isSolved,
//             false);
//         expect(
//             dictation
//                 .paragraphs![0].sentences![0].words![1].characters![c.key].attempts,
//             0);
//         final (newDictation,result) = dictation.tryCharacter(
//             input: inputCharacters[c.key],
//             paragraphIndex: 0,
//             sentenceIndex: 0,
//             wordIndex: 1,
//             solveAnyway: true);
//         dictation = newDictation;
//         expect(
//             dictation
//                 .paragraphs![0].sentences![0].words![1].characters![c.key].isSolved,
//             true);
//                 expect(
//           dictation
//                 .paragraphs![0].sentences![0].words![1].characters![c.key].attempts,
//             1);
//           expect(
//           dictation
//                 .paragraphs![0].sentences![0].words![1].characters![c.key].solvedCount,
//             1);
//                     expect(
//           dictation
//                 .paragraphs![0].sentences![0].words![1].characters![c.key].solveWithHintCount,
//             1);
     
//         expect(result.status, c.key==inputCharacters.length-1 ? SolveStatus.wordSolved:SolveStatus.characterSolved);
//         printCharacter(c.key);
//       }
//     });
//   });
// }
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:characters/characters.dart';

void main() {
  var dictation = DictationSection(
    paragraphs: [
      DictationParagraph(
        sentences: [
          DictationSentence(
            sentence: "Hello world.",
            words: [
              DictationWord.from(index: 0, parentIndex: 0, word: "Hello", start: 0, end: 1),
              DictationWord.from(index: 1, parentIndex: 0, word: "world.", start: 1, end: 2),
            ],
            start: 0,
            end: 2,
          ),
          DictationSentence(
            sentence: "This is a test.",
            words: [
              DictationWord.from(index: 0, parentIndex: 1, word: "This", start: 2, end: 3),
              DictationWord.from(index: 1, parentIndex: 1, word: "is", start: 3, end: 4),
              DictationWord.from(index: 2, parentIndex: 1, word: "a", start: 4, end: 5),
              DictationWord.from(index: 3, parentIndex: 1, word: "test.", start: 5, end: 6),
            ],
            start: 2,
            end: 6,
          ),
        ],
        start: 0,
        end: 6,
      ),
    ],
  );

  final targetCharacters = 'world'.characters.toList();

  DictationCharacter getCharacter(int index) =>
      dictation.paragraphs![0].sentences![0].words![1].characters![index];

  void verifyCharacterState(int index, {required bool solved, required int attempts, required int solvedCount, required int solveWithHintCount}) {
    final char = getCharacter(index);
    expect(char.isSolved, solved);
    expect(char.attempts, attempts);
    expect(char.solvedCount, solvedCount);
    expect(char.solveWithHintCount, solveWithHintCount);
  }

  void updateDictation(String input, int index) {
    final (newDictation, result) = dictation.tryCharacter(
      input: input,
      paragraphIndex: 0,
      sentenceIndex: 0,
      wordIndex: 1,
      solveAnyway: true,
    );
    dictation = newDictation;
    expect(result.status, index == targetCharacters.length - 1 ? SolveStatus.wordSolved : SolveStatus.characterSolved);
  }

  group('tryCharacter test start', () {
    test('correct input test', () {

      for (final entry in targetCharacters.asMap().entries) {
        final index = entry.key;
        final char = entry.value;

        verifyCharacterState(index, solved: false, attempts: 0, solvedCount: 0, solveWithHintCount: 0);
        updateDictation(char, index);
        verifyCharacterState(index, solved: true, attempts: 1, solvedCount: 1, solveWithHintCount: 1);
      }
    });
  });
}
