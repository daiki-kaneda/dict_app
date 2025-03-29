import 'package:dict_app/providers/datatree_provider/file_provider.dart';
import 'package:dict_app/providers/model_provider/llm_role.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'functions_provider.g.dart';

@riverpod
({
  List<String> names,
  Map<String, Function> functions,
  List<FunctionDeclaration> declartions
}) functions(FunctionsRef ref, {required LLMRole role}) {
  switch (role) {
    case TranslateSentences():
      {
        final r = role;
        final names = ['sendTranslatedSentences'];
        return (
          names: names,
          functions: {
            names[0]: ref.read(fileNotifierProvider(r.fileId).notifier).llmSendTranslatedSentences
          },
          declartions: [
            FunctionDeclaration(
                names[0],
                'Send list of translated japanese sentences from english sentences',
                Schema.object(nullable: false, requiredProperties: [
                  'translatedSentences'
                ], properties: {
                  'translatedSentences': Schema.array(
                      items:
                          Schema.string(description: 'Translated japanese sentence'),
                      nullable: false)
                }))
          ]
        );
      }
  }
}
