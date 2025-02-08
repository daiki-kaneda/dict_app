import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_view.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/folder_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentTreeWidget extends ConsumerWidget {
  const CurrentTreeWidget(this.treeId, {super.key});

  final String treeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

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
      return Center(
        child: PlatformCircularProgressIndicator()
      );
    }

    switch(tree){
      case Dict():return DictView(tree);
      case Folder():return FolderView(tree);
    }
  }
}
