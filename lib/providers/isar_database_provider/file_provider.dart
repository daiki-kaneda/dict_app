import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/isar_widgets/utils/platform_dialog.dart';
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/isar_provider.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_provider.g.dart';

@riverpod
class FileNotifier extends _$FileNotifier {
  @override
  File? build(Id id) {
    return isar.files.getSync(id);
  }

  Isar get isar => ref.read(isarProvider).requireValue;

  Future<void> updateFile({
    int? parentId,
    String? title,
    DateTime? createdAt,
    String? audioPath,
    String? description,
    bool? isFavorite,
    double? duration,
    String? transcript,
    DictationSection? paragraphs,
  }) async {
    await isar.writeTxn(() async {
      final file = await isar.files.get(id);
      if (file != null) {
        isar.files.put(file.copyWith(
            title: title,
            createdAt: createdAt,
            audioPath: audioPath,
            description: description,
            isFavorite: isFavorite,
            duration: duration,
            transcript: transcript,
            paragraphs: paragraphs,
            lastUpdatedAt: DateTime.now()));
      }
    });
    ref.invalidateSelf();
  }

  Future<void> resetSection({bool alphabetOnly = true}) async {
    final file = await isar.files.get(id);
    if (file == null) return;
    final newSection = file.paragraphs.reset(alphabetOnly: alphabetOnly);
    updateFile(paragraphs: newSection);
  }

  Future<void> tryCharacter(
      {required String input,
      required int paragraphIndex,
      required int sentenceIndex,
      required int wordIndex,
      bool solveAnyway = false}) async {
    final file = await isar.files.get(id);
    if (file == null) return;
    final (section, result) = file.paragraphs.tryCharacter(
        input: input,
        paragraphIndex: paragraphIndex,
        sentenceIndex: sentenceIndex,
        wordIndex: wordIndex,
        solveAnyway: solveAnyway);
    await updateFile(paragraphs: section);
    _handleResult(result);
    print('tried character:$input');
    print('result:${result.toString()}');
  }

  Future<void> _handleResult(AnswerResult result) async {
    _recordResult(result);
    _updateUIByResult(result);
  }

  Future<void> _recordResult(AnswerResult result) async {}
  Future<void> _updateUIByResult(AnswerResult result) async {
    final withoutHint = !result.solveAnyway;
    switch (result.status) {
      case SolveStatus.unSolved:
        {
          ref.read(showErrorEffectProvider(id).notifier).showEffect();
        }
      case SolveStatus.sectionSolved:
        {
          if (withoutHint) {
            ref
                .read(showSectionSuccessEffectProvider(id).notifier)
                .showEffect();
          }
          showNotifyDialog(navigatorKey.currentContext!,
              title: '完了メッセージ', description: 'この音声のすべての文章を解きました');
        }
      case SolveStatus.paragraphSolved:
        {
          return;
        }
      case SolveStatus.sentenceSolved:
        {
          if (withoutHint) {
            ref
                .read(showSentenceSuccessEffectProvider(id).notifier)
                .showEffect();
          }
          ref
              .read(SentencePageControllerProvider(id).notifier)
              .moveToFirstUnsolvedIndex();
        }
      case SolveStatus.wordSolved:
        {
          if (withoutHint) {
            ref.read(showWordSuccessEffectProvider(id).notifier).showEffect();
          }
          ref
              .read(currentWordIndexProvider(id).notifier)
              .moveToFirstUnsolvedIndex();
        }
      case SolveStatus.characterSolved:
        {}
    }
  }

  Future<Map<String, dynamic>?> llmSendTranslatedSentences(
      Map<String, dynamic> args) async {
    print(args);
    try {
      final translatedSentences = (args['translatedSentences'] as List<dynamic>)
          .cast<String>()
          .toList();

      final file = await isar.files.get(id);
      if (file == null) return args;
      final newSection =
          file.paragraphs.copyWith(translatedSentences: translatedSentences);
      updateFile(paragraphs: newSection);
    } catch (e) {
      print(e);
      return {};
    }

    return args;
  }
}
