import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:characters/characters.dart';

void main() {
  var dictation = DictationParagraphs(
    paragraphs: [
      DictationParagraph(
        sentences: [
          DictationSentence(
            sentence: "Hello world.",
            words: [
              DictationWord.from(word: "Hello", start: 0, end: 1),
              DictationWord.from(word: "world.", start: 1, end: 2),
            ],
            start: 0,
            end: 2,
          ),
          DictationSentence(
            sentence: "This is a test.",
            words: [
              DictationWord.from(word: "This", start: 2, end: 3),
              DictationWord.from(word: "is", start: 3, end: 4),
              DictationWord.from(word: "a", start: 4, end: 5),
              DictationWord.from(word: "test.", start: 5, end: 6),
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
  group('tryCharacter test start', () {
    test('correct input test', () {
      void printCharacter(int index) {
        print(dictation.paragraphs[0].sentences[0].words[1].characters[index]
            .toJson());
      }

      final inputCharacters = 'world';
      for (final c in inputCharacters.characters.toList().asMap().entries) {
        printCharacter(c.key);
        expect(
            dictation
                .paragraphs[0].sentences[0].words[1].characters[c.key].isSolved,
            false);
        dictation = dictation.tryCharacter(
            input: inputCharacters[c.key],
            paragraphIndex: 0,
            sentenceIndex: 0,
            wordIndex: 1,
            solveAnyway: true);
        expect(
            dictation
                .paragraphs[0].sentences[0].words[1].characters[c.key].isSolved,
            true);
        printCharacter(c.key);
      }
    });
  });
}
