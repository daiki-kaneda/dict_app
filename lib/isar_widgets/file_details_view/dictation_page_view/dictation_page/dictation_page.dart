import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictationPage extends ConsumerWidget {
  const DictationPage(this.dictationSentence,{super.key});

  final DictationSentence dictationSentence;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Text('DictationWords'),
        Text('translation')
      ],
    );
  }
}