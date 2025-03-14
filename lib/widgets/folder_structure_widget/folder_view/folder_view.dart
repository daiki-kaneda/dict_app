import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/providers/pending_dict_provider/pending_dict_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/pending_list_tile/pending_list_tile.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/tree_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FolderView extends ConsumerWidget {
  const FolderView(this.folder, {super.key});

  final Folder folder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pendings = ref.watch(pendingDictListNotifierProvider.select(
      (ls)=>ls.where((p)=>p.parentId==folder.id)
    ));
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
          //leading: const FolderPopButton(),
          middle: Text(folder.value.title),
          //trailing: const EditButton()
        ),
        child: ListView(
          children: [
            for(final pending in pendings)
            PendingListTile(pending),
            for (final subFolder in folder.subTrees.whereType<Folder>())
              TreeListTile(subFolder),
            for (final dict in folder.subTrees.whereType<Dict>())
              TreeListTile(dict)
          ],
        ));
  }
}
