import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:dict_app/providers/model_provider/llm_role.dart';
import 'package:dict_app/providers/model_provider/model_property_provider/functions_provider.dart';
import 'package:dict_app/providers/model_provider/model_property_provider/system_instruction_provider.dart';
import 'package:dict_app/providers/model_provider/model_repository.dart';
import 'package:dict_app/providers/model_provider/model_status_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'model_provider.g.dart';

@riverpod
class ModelNotifier extends _$ModelNotifier {
  @override
  FutureOr<ModelRepository> build({required LLMRole role}) async {
    final model = ModelRepository();
    final functionsData = ref.read(functionsProvider(role: role));
    final names = functionsData.names;
    final functions = functionsData.functions;
    final declartions = functionsData.declartions;
    final instructions =
        await ref.watch(systemInstructionProvider(role: role).future);

    print('current system instruction:$instructions');
    final modelStatus = ModelStatus.geminiFlash;
    try {
      await model.init(functions, declartions,
          mode: role.mode,
          allowedFunctionNames: names.toSet(),
          instructions: instructions,
          modelName: modelStatus.modelName);
    } catch (e) {
      print(e);
    }
    return model;
  }

  Future<void> sendMessage(
    String prompt, {
    List<Content> history = const [],
    (String mimeType, Uint8List bytes)? byteData,
  }) async {
    final model = await future;
    GenerateContentResponse response;

    Future<GenerateContentResponse> generateResponse() {
      return model.functionCall(prompt,
          history: history,
          byteData: byteData,
          mode: role.mode,
          filter: role.filter);
    }
    response = await generateResponse();
    if (response.text == null) {
      print('response text is null');
      return;
    } else {
      print('get response:${response.text}');
    }
  }
}
