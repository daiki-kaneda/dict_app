import 'package:google_generative_ai/google_generative_ai.dart';

sealed class LLMRole {
  const LLMRole({this.id,required this.mode,this.filter,this.initialPrompt});

  final String? id;
  final FunctionCallingMode mode;
  final List<FunctionCall> Function(List<FunctionCall>)? filter;
  final String? initialPrompt;

  @override
  bool operator ==(Object other) =>
      other.runtimeType == runtimeType && other is LLMRole && other.id == id;

  @override
  int get hashCode => Object.hash(runtimeType, id);
}

final class Translate extends LLMRole {
  const Translate() : super(
    id:null,
    mode: FunctionCallingMode.any
    );
}

