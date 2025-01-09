import 'dart:async';

import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dict_view_provider.g.dart';

@riverpod
class TypedTextNotifier extends _$TypedTextNotifier {
  final controller = StreamController<String>();
  @override
  Stream<String> build() async* {
    ref.onDispose(() {
      controller.close();
    });

    ref.listenSelf((prev, next) {
      final currentId = ref.read(currentTreeIdNotifierProvider);
      final isDictShowing = ref.read(isDictShowingProvider);
      final currentParagraphIndex = ref.read(paragraphIndexNotifierProvider);
      final currentSentenceIndex = ref.read(sentenceIndexNotifierProvider);
      final currentWordIndex = ref.read(wordIndexNotifierProvider);
      if (isDictShowing.value != true || currentId.value == null ||currentWordIndex==-1) return;

      final prevText = prev?.value;
      final nextText = next.value;
      if (nextText == null) return;
      if (prevText!=null && prevText.length >= nextText.length) return;

      ref.read(dataTreeNotifierProvider.notifier).tryCharacter(
        input: nextText.characters.last, 
        dictId: currentId.value!, 
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

@riverpod
class InputTextFieldFocusNode extends _$InputTextFieldFocusNode {
  @override
  FocusNode build() {
    return FocusNode();
  }

  void requestFocus() {
    state.requestFocus();
  }

  void unfocus() {
    state.unfocus();
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
class InputTextFieldControllerNotifier
    extends _$InputTextFieldControllerNotifier {
  @override
  TextEditingController build() {
    ref.onDispose(
      () {
        state.dispose();
      },
    );
    final controller = TextEditingController();
    return controller;
  }

  void update(String newText) {
    state.text = newText;
  }
}



