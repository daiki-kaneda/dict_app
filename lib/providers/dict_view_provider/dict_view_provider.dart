import 'dart:async';

import 'package:dict_app/models/data_tree/dict_data/dict_problem/dictation_sentence.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dict_view_provider.g.dart';


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