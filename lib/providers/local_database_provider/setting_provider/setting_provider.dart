import 'dart:convert';

import 'package:dict_app/models/setting.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/providers/local_database_provider/local_data_status.dart';
import 'package:dict_app/providers/local_database_provider/local_database_provider.dart';
import 'package:dict_app/providers/model_provider/llm_role.dart';
import 'package:dict_app/providers/model_provider/model_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'setting_provider.g.dart';

@Riverpod(keepAlive: true)
class SettingNotifier extends _$SettingNotifier {
  @override
  FutureOr<Setting> build() async {
    // when update,always save
    listenSelf((_, __) {
      saveData();
    });

    final localData = await ref.read(localDatabaseProvider.future);
    final savedString = localData.loadData(LocalDataStatus.setting);
    if (savedString != null) {
      try {
        final savedData =
            Setting.fromJson(jsonDecode(savedString) as Map<String, dynamic>);
        return savedData;
      } catch (e) {
        print(e.toString());
      }
    }

    // initial data
    return Setting(remainingTickets: 3);
  }

  Future<void> saveData() async {
    final localData = await ref.read(localDatabaseProvider.future);
    final previousState = await future;
    localData.saveData(LocalDataStatus.setting, jsonEncode(previousState));
  }

  Future<void> updateSetting({
    int? textSize,
    bool? showTranslation,
    double? audioSpeed,
    bool? repeatAudio,
    bool? appendAnswer,
    bool? appendTranslation,
    bool? separateWordsWithParentheses,
    bool? connectUnderlinedParts,
    bool? showUnderlinedParts,
    bool? showPageNumbers,
    bool? hideOnlyAlphabet,
    String? languageCode,
  }) async {
    final previousState = await future;
    state = AsyncData(previousState.copyWith(
      textSize: textSize,
      showTranslation: showTranslation,
      audioSpeed: audioSpeed,
      repeatAudio: repeatAudio,
      appendTranslation: appendTranslation,
      appendAnswer: appendAnswer,
      separateWordsWithParentheses: separateWordsWithParentheses,
      connectUnderlinedParts: connectUnderlinedParts,
      showUnderlinedParts: showUnderlinedParts,
      showPageNumbers: showPageNumbers,
      hideOnlyAlphabet: hideOnlyAlphabet,
      languageCode: languageCode,
    ));
  }

  Future<void> consumeTickets({int amount = 1}) async {
    final previousState = await future;
    state = AsyncData(previousState.consume(amount: amount));
  }

  Future<void> addTickets({required int amount}) async {
    final previousState = await future;
    state = AsyncData(previousState.addTickets(amount));
  }

  Future<bool> hasTickets() async {
    final previousState = await future;
    return previousState.remainingTickets > 0;
  }

  Future<void> createTranslatedSentences(int fileId) async {
    final previousSetting = await future;
    final file = ref.read(fileNotifierProvider(fileId));
    if (file == null) return;
    if (file.paragraphs
        .translatedSentences(previousSetting.languageCode)
        .isEmpty) {
      final sentences = file.getAllSentences.map((s) => s.displayText).toList();
      ref
          .read(modelNotifierProvider(role: TranslateSenteces(fileId)).notifier)
          .sendMessage(jsonEncode(sentences));
    }
  }
}
