
import 'package:dict_app/providers/model_provider/llm_role.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'system_instruction_provider.g.dart';

@riverpod
class SystemInstruction extends _$SystemInstruction {
  @override
  Future<String> build({required LLMRole role}) async {
    return '';
}
}
