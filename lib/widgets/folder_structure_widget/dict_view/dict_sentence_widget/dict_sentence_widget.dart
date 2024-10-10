import 'package:dict_app/extension/extension.dart';
import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_word_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DictSentenceWidget extends ConsumerWidget {
  const DictSentenceWidget(this.sentence, this.focusNode,{super.key});

  final DictationSentence sentence;

  final FocusNode focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(wordIndexNotifierProvider);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child:Wrap(
              spacing: 10,
              children: sentence.words.asMap().entries.map((e)=>DictWordWidget(e.key, e.value, focusNode)).toList()
            ) 
        );
  }
}
