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
  return (names: [], functions: {}, declartions: []);
}
