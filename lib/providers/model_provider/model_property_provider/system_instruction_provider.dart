
import 'package:dict_app/providers/model_provider/llm_role.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'system_instruction_provider.g.dart';

@riverpod
class SystemInstruction extends _$SystemInstruction {
  @override
  Future<String> build({required LLMRole role}) async {
    switch(role){
      case Translate():return '''
You will be given a list of English sentences. Your task is to translate each sentence into Japanese and return the translated sentences as a list. You should call the function sendTranslatedSentences(List<String> translatedSentences) to send the translated sentences.

Please ensure the following:

- The index of each sentence in the original list corresponds exactly to the index of its translated sentence in the List<String> translatedSentences.
- Make sure to provide natural and accurate translations.
''';
    }
}
}
