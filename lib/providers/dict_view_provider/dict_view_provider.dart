import 'dart:async';

import 'package:dict_app/models/data_tree/dict_data/dict_problem/dictation_sentence_problem.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dict_view_provider.g.dart';

@riverpod
String correctWord(CorrectWordRef ref) {
  return 'While I was walking through the park on a quiet Sunday afternoon, enjoying the fresh air and the sound of birds singing in the trees, I couldn\'t help but reflect on how important it is to take a break from the hustle and bustle of everyday life in order to recharge and gain a fresh perspective on things that truly matter.';
}

@riverpod
class DictationSentenceProblemNotifier extends _$DictationSentenceProblemNotifier {
  @override
  DictationSentenceProblem build() {
    final correctWord = ref.watch(correctWordProvider);
    ref.listen(
      typedTextNotifierProvider, 
      (prev,next){
        final prevText = prev?.value;
        final nextText = next.value;
        if(prevText!=null && nextText!=null && 
        prevText.length<nextText.length){
          tryCharacter(nextText);
        }
        
      });
    return DictationSentenceProblem.from(sentence: correctWord);
  }

  void tryCharacter(String input){
    state = state.tryCharacter(input: input);
  }
  
}

@riverpod
class TypedTextNotifier extends _$TypedTextNotifier {
  final controller = StreamController<String>();
  @override
  Stream<String> build() async*{
    ref.onDispose((){
      controller.close();
    });
    yield* controller.stream;
  }
  void emitCharacter(String character){
    controller.add(character);
  }
}


@riverpod
class InputTextFieldFocusNode extends _$InputTextFieldFocusNode {
  @override
  FocusNode build() {
    return FocusNode();
  }

  void requestFocus(){
    state.requestFocus();
  }

  void unfocus(){
    state.unfocus();
  }

  void toggle(){
    if(state.hasFocus){
      state.unfocus();
    }else{
      state.requestFocus();
    }
  }
}

@riverpod
class InputTextFieldControllerNotifier extends _$InputTextFieldControllerNotifier {
  @override
  TextEditingController build() {
    ref.onDispose((){
      state.dispose();
    },);
    final controller = TextEditingController();
    return controller;
  }

  void update(String newText) {
    state.text = newText;
  }
}