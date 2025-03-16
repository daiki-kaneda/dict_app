import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/data_tree_isar/item.dart';
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
            paragraphs: paragraphs));
      }
    });
    ref.invalidateSelf();
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
        wordIndex: wordIndex);
    await updateFile(paragraphs: section);
    print('tried character:$input');
    print('result:${result.toString()}');
  }
}
