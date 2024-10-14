import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/providers/dict_view_provider/dict_view_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/pop_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/reset_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_paragraph_listview/dict_paragraph_listview.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_sentence_widget.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/input_text_field.dart';
import 'package:dict_app/widgets/player_widget/player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictView extends ConsumerStatefulWidget {
  const DictView(this.dict,{super.key});

  final Dict dict;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DictViewState();
}

class _DictViewState extends ConsumerState<DictView> {
  final focusNode = FocusNode();

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          trailing: const ResetButton(ResetStatus.paragraphs),
          leading: const FolderPopButton(),
          middle: Text('paragraphs'
           // widget.dict.value.title
            ),
        ),
        child: Center(child: 
        SafeArea(
          child: DictParagraphListview(widget.dict.id, focusNode),
        //     child: Stack(
        //   children: [
        //     Column(
        //       children: [
        //         Expanded(child: DictSentenceWidget(widget.dict.id,focusNode)),
        //         // Align(
        //         //     alignment: Alignment.bottomCenter,
        //         //     child: 
        //             Container(
        //               padding: EdgeInsets.only(bottom: 20),
        //               color: CupertinoColors.white,
        //               child: PlayerWidget(),
        //             ),
        //          // ),
        //         ],
        //     ),
        //     InputTextField(focusNode),
        //   ],
        // )
        ),));
  }
}