import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_paragraph_widget/dict_paragraph_widget.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_listview/dict_sentence_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictParagraphListview extends ConsumerWidget {
  const DictParagraphListview(this.id, this.focusNode, {super.key});

  final String id;

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final paragraphs = ref.watch(dataTreeNotifierProvider.select(
      (dataTreeAsync){
        if(dataTreeAsync.hasValue)return dataTreeAsync.value!.readLeafById(id: id)?.value.paragraphs;
        return null;
      }
    ));
    if(paragraphs==null) return Center(child: CircularProgressIndicator(),);
    return ListView(
      children: paragraphs.paragraphs
          .asMap()
          .entries
          .map((e) => ListTile(
                title: Text(e.key.toString()),
                onTap: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) {
                      return CupertinoPageScaffold(
                          navigationBar: CupertinoNavigationBar(),
                          child: SafeArea(
                              child:
                                  // DictParagraphWidget(e.value, focusNode)
                                  DictSentenceListview(e.value, focusNode)));
                    },
                  ));
                },
              ))
          .toList(),
    );
  }
}
