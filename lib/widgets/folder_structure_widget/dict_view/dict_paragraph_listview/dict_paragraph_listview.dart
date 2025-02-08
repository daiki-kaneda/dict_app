import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/reset_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/button/dict_pop_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_listview/dict_sentence_listview.dart';
import 'package:dict_app/widgets/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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
    if(paragraphs==null) return Center(child: PlatformCircularProgressIndicator(),);
    return ListView(
      children: paragraphs.paragraphs
          .asMap()
          .entries
          .map((e) => PlatformListTile(
                leading: CompletenessIcon(paragraphs.paragraphs[e.key].isCompleted),
                title: Text(e.key.toString()),
                onTap: () {
                  ref.read(paragraphIndexNotifierProvider.notifier).updateIndex(e.key);
                  Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) {
                      return CupertinoPageScaffold(
                          navigationBar: CupertinoNavigationBar(
                            backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
                            leading: DictPopButton(),
                            middle: Text('paragraph-${e.key}'),
                            trailing: const ResetButton(ResetStatus.paragraph),
                          ),
                          child: SafeArea(
                              child:DictSentenceListview(id,e.key, focusNode)));
                    },
                  ));
                },
              ))
          .toList(),
    );
  }
}
