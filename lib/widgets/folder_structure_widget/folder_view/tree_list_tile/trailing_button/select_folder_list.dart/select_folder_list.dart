import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectFolderList extends ConsumerWidget {
  const SelectFolderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = ref.watch(dataTreeNotifierProvider.select(
      (treeAsync){
        return treeAsync.when(
          data: (tree){
            return tree.nodes();
          }, 
          error: (_,__)=>null, 
          loading: ()=>null);
      }
    ));
    if(nodes!=null){
      return ListView(
        children: [
          for(final node in nodes)
          ListTile(
            title: Text(node.value.title),
            onTap: () {
              Navigator.of(context)
              .pop(node.id);
            },
          )
        ],
      );
    }else{
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
  }
}