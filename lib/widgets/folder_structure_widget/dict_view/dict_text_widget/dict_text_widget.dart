import 'package:dict_app/models/data_tree/dict_data/dict_problem/dictation_data_model.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_text_widget/dict_word_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictTextWidget extends ConsumerWidget {
  const DictTextWidget(this.dictId,{super.key});

  final String dictId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<DictationWord>? wordProblems = ref.watch(dataTreeNotifierProvider.select(
      (dataTreeAsync){
        return dataTreeAsync.when(data: 
        (dataTree){
          return dataTree.readLeafById(id: dictId)
          ?.value.wordProblems;
        }, 
        error: (_,__)=>null, 
        loading: ()=>null);
      }
    ));
    if(wordProblems==null){
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }
    return Wrap(
      spacing: 10,
      children: [
        for(final word in wordProblems)
        DictWordWidget(word)
      ],
    );
  }
}