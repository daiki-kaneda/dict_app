import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/pop_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/reset_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_paragraph_listview/dict_paragraph_listview.dart';
import 'package:flutter/cupertino.dart';
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
          backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          trailing: const ResetButton(ResetStatus.paragraphs),
          //leading: const FolderPopButton(),
          middle: Text(widget.dict.value.title),
        ),
        child: 
        SafeArea(
          child: DictParagraphListview(widget.dict.id, focusNode)
        ),);
  }
}