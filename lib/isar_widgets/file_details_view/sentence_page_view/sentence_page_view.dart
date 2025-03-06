import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SentencePageView extends ConsumerWidget {
  const SentencePageView({super.key, required this.sentences});

  final List<DictationSentence> sentences;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return Center(
          child: Text(sentences[index].displayText),
        );
      },
      itemCount: sentences.length,
    );
  }
}
