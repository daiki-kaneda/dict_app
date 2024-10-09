import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_sentence_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictParagraphWidget extends ConsumerWidget {
  const DictParagraphWidget(this.paragraph,this.focusNode,{super.key});

  final DictationParagraph paragraph;

  final FocusNode focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemBuilder:(context, index) {
        final sentence = paragraph.sentences.elementAtOrNull(index);
        if(sentence==null) return null;
        return DictSentenceWidget(sentence, focusNode);
      },);
  }
}