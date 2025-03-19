import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ModelRepository {
  late final GenerativeModel model;

  late final Map<String, Function> _functions;

  Future<void> init(Map<String, Function> functions,
      List<FunctionDeclaration> functionDeclarations,
      {FunctionCallingMode? mode,
      Set<String>? allowedFunctionNames,
      String? instructions,
      String modelName = 'gemini-1.5-flash'}) async {
    _functions = functions;

    model = await getModel(
        functionDeclarations: functionDeclarations,
        mode: mode,
        //allowedFunctionNames: allowedFunctionNames,
        instructions: instructions);
  }

  Future<FunctionResponse?> _dispatchFunctionCall(FunctionCall call) async {
    print('predicted function name:${call.name},parameters:${call.args}');
    final function = _functions[call.name];
    if (function == null) return null;
    final result = await function(call.args);
    return FunctionResponse(call.name, result);
  }

  Future<GenerateContentResponse> functionCall(
    String prompt, {
    List<Content> history = const [],
    (String mimeType, Uint8List bytes)? byteData,
    FunctionCallingMode mode = FunctionCallingMode.any,
    List<FunctionCall> Function(List<FunctionCall>)? filter,
  }) async {
    final contents = [
      ...history,
      if (byteData != null)
        Content.multi([DataPart(byteData.$1, byteData.$2), TextPart(prompt)]),
      if (byteData == null) Content.text(prompt),
    ];

    var response = await model.generateContent(contents);

    List<FunctionCall> functionCalls = response.functionCalls.toList();
    switch (mode) {
      case FunctionCallingMode.any:
        {
          if ((functionCalls =
                  filter != null ? filter(functionCalls) : functionCalls)
              .isNotEmpty) {
            for (final call in functionCalls) {
              await _dispatchFunctionCall(call);
            }
          }
        }
      case FunctionCallingMode.auto:
        {
          while ((functionCalls = response.functionCalls.toList()).isNotEmpty) {
            print('length of functions :${response.functionCalls.toList().length}');
            final responses = ([
              for (final call in functionCalls)
                await _dispatchFunctionCall(call)
            ]).whereType<FunctionResponse>().toList();

            contents
              ..add(response.candidates.first.content)
              ..add(Content.functionResponses(responses));
            response = await model.generateContent(contents);
          }
        }
      case FunctionCallingMode.none:{}
    }
    print(
        'current total tokens:${(await model.countTokens(contents)).totalTokens}');
    print(response.text);
    return response;
  }
}

Future<String> getApiKey() async {
  await dotenv.load(fileName: '.env');
  return dotenv.get('API_KEY_GEMINI');
}

Future<GenerativeModel> getModel(
    {bool codeExcution = false,
    Schema? responseSchema,
    List<FunctionDeclaration>? functionDeclarations,
    FunctionCallingMode? mode,
    String? instructions,
    List<SafetySetting> safetySettings = const [],
    String modelName = 'gemini-1.5-flash'}) async {
  final apiKey = await getApiKey();
  return GenerativeModel(
      model: modelName,
      safetySettings: safetySettings,
      apiKey: apiKey,
      toolConfig: mode != null
          ? ToolConfig(functionCallingConfig: FunctionCallingConfig(mode: mode))
          : null,
      tools: [
        if (codeExcution) Tool(codeExecution: CodeExecution()),
        if (functionDeclarations != null)
          Tool(functionDeclarations: functionDeclarations)
      ],
      generationConfig: GenerationConfig(
        responseMimeType: responseSchema != null ? 'application/json' : null,
        responseSchema: responseSchema,
      ),
      systemInstruction:
          instructions != null ? Content.system(instructions) : null);
}

Future<DataPart> fileToPart(String path,
    {String mimeType = 'image/jpeg'}) async {
  return DataPart(mimeType, await File(path).readAsBytes());
}
