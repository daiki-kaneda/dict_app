import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_view.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/folder_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FolderStructureWidget extends ConsumerWidget {
  const FolderStructureWidget(this.treeId, {super.key, this.isRoute = false});

  final String treeId;
  final bool isRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> onTapTile(String treeId) async {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) {
          return FolderStructureWidget(treeId);
        },
      ));
      ref.read(currentTreeIdNotifierProvider.notifier).updateId(treeId);
    }

    final tree = ref.watch(dataTreeNotifierProvider.select((treeAsync) {
      return treeAsync.when(
          data: (tree) {
            final nodeMatched = tree.readNodeById(nodeId: treeId);
            final leafMatched = tree.readLeafById(id: treeId);
            if (nodeMatched != null) return nodeMatched;
            if (leafMatched != null) return leafMatched;
            return null;
          },
          error: (_, __) => null,
          loading: () => null);
    }));

    if (tree == null) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }

    switch(tree){
      case Dict():return DictView(tree);
      case Folder():return FolderView(tree);
    }
  }
}
