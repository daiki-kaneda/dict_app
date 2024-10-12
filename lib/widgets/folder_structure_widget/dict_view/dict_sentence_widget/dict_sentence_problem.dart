import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_sentence_widget.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/input_text_field.dart';
import 'package:dict_app/widgets/player_widget/player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictSentenceProblemView extends ConsumerWidget {
  const DictSentenceProblemView(
    this.dictId,
    this.paragraphIndex,
    this.sentenceIndex,
    this.focusNode,{super.key});

  final String dictId;
  final int paragraphIndex;
  final int sentenceIndex;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
          children: [
            Column(
              children: [
                Expanded(child: DictSentenceWidget(focusNode)),
                // Align(
                //     alignment: Alignment.bottomCenter,
                //     child: 
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      color: CupertinoColors.white,
                      child: PlayerWidget(),
                    ),
                 // ),
                ],
            ),
            InputTextField(focusNode),
          ],
        );
  }
}