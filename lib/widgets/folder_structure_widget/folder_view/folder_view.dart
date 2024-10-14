import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/pop_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/tree_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FolderView extends ConsumerWidget {
  const FolderView(this.folder, {super.key});

  final Folder folder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: const FolderPopButton(),
          middle: Text(folder.value.title),
          //trailing: const EditButton()
        ),
        child: ListView(
          children: [
            for (final subFolder in folder.subTrees.whereType<Folder>())
              TreeListTile(subFolder),
            for (final dict in folder.subTrees.whereType<Dict>())
              TreeListTile(dict)
          ],
        ));
  }
}
