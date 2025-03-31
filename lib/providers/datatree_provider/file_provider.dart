import 'package:dict_app/providers/logs_provider/logs_provider.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:dict_app/widgets/app.dart';
import 'package:dict_app/widgets/utils/platform_dialog.dart';
import 'package:dict_app/models/data_tree/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/data_tree/item.dart';
import 'package:dict_app/providers/datatree_provider/file_details_provider.dart';
import 'package:dict_app/providers/datatree_provider/isar_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
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

  Future<void> _recordResult(AnswerResult result) async {
    ref.read(logsProvider.notifier).addLogEntry(fileId: id, result: result);

    switch (result.status) {
      case SolveStatus.unSolved:
        {}
      case SolveStatus.sectionSolved:
        {
          final file = isar.files.getSync(id);
          if (file != null) {
            updateFile(
                paragraphs: file.paragraphs.copyWith(
                    completedCount: file.paragraphs.completedCount + 1));
          }
        }
      case SolveStatus.paragraphSolved:
        {}
      case SolveStatus.sentenceSolved:
        {}
      case SolveStatus.wordSolved:
        {}
      case SolveStatus.characterSolved:
        {}
    }
  }

  Future<void> _updateUIByResult(AnswerResult result) async {
    final withoutHint = !result.solveAnyway;

    void pageScroll() => ref
        .read(SentencePageControllerProvider(id).notifier)
        .moveToFirstUnsolvedIndex();

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
              title: l10n().completionDialogTitle,
              description: l10n().completionDialogContent);
        }
      case SolveStatus.paragraphSolved:
        {
          pageScroll();
        }
      case SolveStatus.sentenceSolved:
        {
          if (withoutHint) {
            ref
                .read(showSentenceSuccessEffectProvider(id).notifier)
                .showEffect();
          }
          pageScroll();
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
      final languageCode = (await ref.read(settingNotifierProvider.future))
          .translationTargetLanguageCode;

      final file = await isar.files.get(id);
      if (file == null) return args;
      final newSection = file.paragraphs.copyWith(translations: [
        ...file.paragraphs.translations,
        TranslatedSentences(
            languageCode: languageCode,
            translatedSentences: translatedSentences)
      ]);
      updateFile(paragraphs: newSection);
    } catch (e) {
      print(e);
      return {};
    }

    return args;
  }
}
