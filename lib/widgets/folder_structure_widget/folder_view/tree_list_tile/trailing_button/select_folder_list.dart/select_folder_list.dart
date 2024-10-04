import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/trailing_button/select_folder_list.dart/select_folder_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectFolderList extends ConsumerWidget {
  const SelectFolderList({
    super.key,
    required this.sourceId,
    this.isTask=false});

  final String sourceId;
  final bool isTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final root = ref.watch(dataTreeNotifierProvider.select(
      (treeAsync){
        return treeAsync.when(
          data: (tree){
            return tree;
          }, 
          error: (_,__)=>null, 
          loading: ()=>null);
      }
    ));
    if(root!=null){
      return ListView(
        children: [
          SelectTargetFolderListTile(root,sourceId)
          // for(final subF in root.subTrees.whereType<Folder>())
          // SelectFolderListTile(subF)
        ],
      );
    }else{
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
  }
}