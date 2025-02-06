import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_sentence_widget.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/input_text_field.dart';
import 'package:dict_app/widgets/player_widget/player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictSentenceProblemView extends ConsumerWidget {
  const DictSentenceProblemView(
    this.focusNode,{super.key});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
          children: [
            Column(
              children: [
                Expanded(child: DictSentenceWidget(focusNode)),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      color: CupertinoTheme.of(context).scaffoldBackgroundColor,
                      child: PlayerWidget(),
                    ),
                ],
            ),
            InputTextField(focusNode),
          ],
        );
  }
}