import 'dart:convert';

import 'package:dict_app/providers/model_provider/llm_role.dart';
import 'package:dict_app/providers/model_provider/model_property_provider/system_instruction_provider.dart';
import 'package:dict_app/providers/model_provider/model_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final container = createContainer();
  container.listen(
      modelNotifierProvider(role: const TranslateSenteces()), (_, __) {});
  container.listen(
      systemInstructionProvider(role: const TranslateSenteces()), (_, __) {});
  group('model_provider test start', () {
    test('translate complicated sentences test', () {
      List<String> englishSentences = [
        "The rapid advancement of technology has led to a significant shift in how people communicate and interact with the world around them.",
        "While artificial intelligence is becoming an increasingly important part of various industries, it is essential to consider both the benefits and potential risks associated with its widespread adoption.",
        "In the near future, autonomous vehicles could drastically change the landscape of transportation, reducing traffic accidents and improving overall efficiency.",
        "Environmental sustainability is not just a matter of preserving natural resources, but also a responsibility to ensure that future generations can live in a world that is conducive to their well-being.",
        "As we continue to explore the vast possibilities of space exploration, it is important to remember that the technology and knowledge we develop may have far-reaching implications for life on Earth."
      ];

      expect(
          container
              .read(modelNotifierProvider(role: const TranslateSenteces())
                  .notifier)
              .sendMessage(jsonEncode(englishSentences)),
          completes);
    });
  });
}
