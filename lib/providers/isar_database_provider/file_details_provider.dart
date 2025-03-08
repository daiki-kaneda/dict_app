import 'dart:async';

import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:dict_app/providers/api_helper_provider/api_helper_provider.dart';
import 'package:dict_app/providers/app_documents_directory_provider/app_documents_directory_provider.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/file_picker_provider/file_picker_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/providers/isar_database_provider/isar_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/utils/dialog.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_details_provider.g.dart';

// This [PageController] must autodispose to avoid More than one [PageView] using the same [PageController]
@riverpod
class SentencePageController extends _$SentencePageController {
  @override
  PageController build() {
    final controller = PageController();
    controller.addListener(_onPageChanged);
    ref.onDispose(() {
      controller.removeListener(_onPageChanged);
      controller.dispose();
    });

    return controller;
  }

  void _onPageChanged() {
    final page = state.page;
    if (page == null || page.toInt() != page) return;
    print('currentPage:$page');
    ref.read(currentSentenceIndexProvider.notifier).updateIndex(page.toInt());
  }
}

@riverpod
class CurrentSentenceIndex extends _$CurrentSentenceIndex {
  @override
  int build() {
    listenSelf((_, __) {
      final currentSentence = getCurrentSentence();
      final (start, end) = (currentSentence?.start, currentSentence?.end);
      if (start != null && end != null) {
        print((start, end));
      }
    });
    return 0;
  }

  Isar get isar => ref.read(isarProvider).requireValue;

  DictationSentence? getCurrentSentence() {
    final fileId = PathParamerterKeys.fileId.getCurrentValue();
    if (fileId == null) return null;

    final targetSentence =
        ref.read(fileNotifierProvider(fileId))?.getAllSentences?[state];
    print(('currentText:${targetSentence?.displayText}'));
    return targetSentence;
  }

  updateIndex(int index) {
    state = index;
  }
}

@riverpod
class CurrentWordIndex extends _$CurrentWordIndex {
  @override
  int build() {
    return 0;
  }

  updateIndex(int index) {
    state = index;
  }
}

@riverpod
class CurrentParagraphIndex extends _$CurrentParagraphIndex {
  @override
  int build() {
    final sentence = ref.watch(currentSentenceIndexProvider.notifier).getCurrentSentence();
    return sentence?.parentIndex ?? 0;
  }

  updateIndex(int index) {
    state = index;
  }
}

@riverpod
class TypedTextNotifier extends _$TypedTextNotifier {
  final controller = StreamController<String>();
  @override
  Stream<String> build() async* {
    ref.onDispose(() {
      controller.close();
    });

    ref.listenSelf((prev, next) {
      final fileId = PathParamerterKeys.fileId.getCurrentValue();
      final currentParagraphIndex = ref.read(currentParagraphIndexProvider);
      final currentSentenceIndex = ref.read(currentSentenceIndexProvider);
      final currentWordIndex = ref.read(currentWordIndexProvider);
      if (fileId == null) return;

      final nextText = next.value;
      if (nextText == null || nextText.isEmpty) return;

      final targetCharacter = nextText.characters.last;
      // Space key move word selection

      if (targetCharacter == ' ') {
        ref
            .read(currentWordIndexProvider.notifier)
            .updateIndex(currentWordIndex + 1);
        return;
      }
      ref.read(FileNotifierProvider(fileId).notifier).tryCharacter(
          input: targetCharacter,
          paragraphIndex: currentParagraphIndex,
          sentenceIndex: currentSentenceIndex,
          wordIndex: currentWordIndex);
      print('tryCharacter: ${nextText.characters.last}');
    });
    yield* controller.stream;
  }

  void emitText(String text) {
    controller.add(text);
  }
}
