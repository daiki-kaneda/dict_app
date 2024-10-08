import 'package:dict_app/extension/extension.dart';
import 'package:dict_app/models/data_tree/dict_data/dict_problem/dictation_data_model.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_text_widget/dict_word_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DictTextWidget extends ConsumerWidget {
  const DictTextWidget(this.dictId, this.focusNode,{super.key});

  final String dictId;

  final FocusNode focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MapEntry<int, DictationWord>>? wordProblemsIndexed =
        ref.watch(dataTreeNotifierProvider.select((dataTreeAsync) {
      return dataTreeAsync.when(
          data: (dataTree) {
            return dataTree.readLeafById(id: dictId)?.value.wordProblems
            .asMap().entries.toList();
          },
          error: (_, __) => null,
          loading: () => null);
    }));
    if (wordProblemsIndexed == null) {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child:
            ListView.builder(
              itemBuilder:(context, index) {
            const count = 50;
            final words=wordProblemsIndexed.splitBySize(count).elementAtOrNull(index);
            if(words==null)return null;
            return
              Wrap(
              spacing: 10,
              children: words.map((e)=>DictWordWidget(e.key, e.value, focusNode)).toList()
            );

            },)
            //CupertinoScrollbar(child:
        //     SingleChildScrollView(
        //   child: Wrap(
        //     spacing: 10,
        //     children: [for (final word in wordProblems) DictWordWidget(word)],
        //   ),
        // )
        //)
        );
  }
}
