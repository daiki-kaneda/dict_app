import 'dart:async';

import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/providers/isar_database_provider/isar_provider.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_details_provider.g.dart';

// This [PageController] must autodispose to avoid More than one [PageView] using the same [PageController]
@riverpod
class SentencePageController extends _$SentencePageController {
  @override
  PageController build(int fileId) {
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
    ref
        .read(currentSentenceIndexInAllSentencesProvider(fileId).notifier)
        .updateIndex(page.toInt());
  }

  moveToFirstUnsolvedIndex() {
    final firstUnsolvedIndex = ref
            .read(FileNotifierProvider(fileId))
            ?.getAllSentences
            ?.indexWhere((s) => !s.isCompleted) ??
        -1;
    if (firstUnsolvedIndex != -1 && state.hasClients) {
      state.animateToPage(firstUnsolvedIndex,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }
}

@riverpod
class CurrentSentenceIndexInAllSentences
    extends _$CurrentSentenceIndexInAllSentences {
  @override
  int build(int fileId) {
    return 0;
  }

  Isar get isar => ref.read(isarProvider).requireValue;

  DictationSentence? getCurrentSentence() {
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
  int build(int fileId) {
    return 0;
  }

  updateIndex(int index) {
    final currentSentence = ref
        .read(currentSentenceIndexInAllSentencesProvider(fileId).notifier)
        .getCurrentSentence();
    if (index >= 0 && (currentSentence?.words?.length ?? 0) > index) {
      state = index;
    }
  }

  moveToFirstUnsolvedIndex() {
    final firstUnsolvedIndex = currentFirstUnsolvedIndex();
    if (firstUnsolvedIndex != null && firstUnsolvedIndex != -1) {
      updateIndex(firstUnsolvedIndex);
    }
  }

  int? currentFirstUnsolvedIndex() {
    return ref
        .read(currentSentenceIndexInAllSentencesProvider(fileId).notifier)
        .getCurrentSentence()
        ?.firstUnsolvedIndex;
  }

  bool currentWordIsCompleted(){
    final index = currentFirstUnsolvedIndex();
    return index==null || index<0;
  }
}

@riverpod
class CurrentSentenceIndex extends _$CurrentSentenceIndex {
  @override
  int build(int fileId) {
    final sentence = ref
        .watch(currentSentenceIndexInAllSentencesProvider(fileId).notifier)
        .getCurrentSentence();
    print('parentIndex:${sentence?.parentIndex}');
    return sentence?.index ?? 0;
  }

  updateIndex(int index) {
    state = index;
  }
}

@riverpod
class CurrentParagraphIndex extends _$CurrentParagraphIndex {
  @override
  int build(int fileId) {
    final sentence = ref
        .watch(currentSentenceIndexInAllSentencesProvider(fileId).notifier)
        .getCurrentSentence();
    print('parentIndex:${sentence?.parentIndex}');
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
  Stream<String> build(int fileId) async* {
    ref.onDispose(() {
      controller.close();
    });

    listenSelf((prev, next) {
      final currentWordIndexNotifier =currentWordIndexProvider(fileId);
      if(ref.read(currentWordIndexNotifier.notifier).currentWordIsCompleted())return;

      final currentParagraphIndex =
          ref.read(currentParagraphIndexProvider(fileId));
      final currentSentenceIndex =
          ref.read(currentSentenceIndexProvider(fileId));
      final currentWordIndex = ref.read(currentWordIndexNotifier);

      final nextText = next.value;
      if (nextText == null || nextText.isEmpty) return;

      final targetCharacter = nextText.characters.last;
      // Space key move word selection

      if (targetCharacter == ' ') {
        ref
            .read(currentWordIndexProvider(fileId).notifier)
            .updateIndex(currentWordIndex + 1);
        return;
      }
      ref.read(FileNotifierProvider(fileId).notifier).tryCharacter(
          input: targetCharacter,
          paragraphIndex: currentParagraphIndex,
          sentenceIndex: currentSentenceIndex,
          wordIndex: currentWordIndex);
      print(
          'tryCharacter: ${nextText.characters.last},($currentParagraphIndex,$currentSentenceIndex,$currentWordIndex,)');
    });
    yield* controller.stream;
  }

  void emitText(String text) {
    controller.add(text);
  }
}

@riverpod
class InputTextFieldFocusNode extends _$InputTextFieldFocusNode {
  @override
  FocusNode build() {
    ref.onDispose((){
      state.removeListener(_onFocusChange);
      state.dispose();
    });
    final focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);
    return focusNode;
  }

  void _onFocusChange(){
    print('input text field focus changed');
  }

  void requestFocus() {
    if(!state.hasFocus)state.requestFocus();
  }

  void unfocus() {
    if(state.hasFocus)state.unfocus();
  }

  void toggle() {
    if (state.hasFocus) {
      state.unfocus();
    } else {
      state.requestFocus();
    }
  }
}

@riverpod
class CurrentTabIndex extends _$CurrentTabIndex {
  @override
  int build(int fileId) {
    return 0;
  }

  updateIndex(int newIndex) {
    state = newIndex;
  }
}

@riverpod
class ShowErrorEffect extends _$ShowErrorEffect {
  @override
  bool build(int fileId) {
    return false;
  }

  void showEffect({Duration duration = const Duration(milliseconds: 250)}) {
    if (!state) {
      state = true;
      Future.delayed(duration, () {
        if (state) hideEffect();
      });
    }
  }

  void hideEffect() {
    if (state) state = false;
  }

  void toggle() {
    state = !state;
  }
}
