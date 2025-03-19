import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/trailing_button/select_folder_list.dart/expansion_tile/custom_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectTargetFolderListTile extends ConsumerWidget {
  const SelectTargetFolderListTile(this.folder,this.sourceId, {super.key});

  final Folder folder;

  final String sourceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subFolders = folder.subTrees.whereType<Folder>();

    final enabled = sourceId!=folder.id;

    void onTapTile() {
      Navigator.of(context).pop(folder.id);
    }

    if (subFolders.isEmpty) {
      return PlatformListTile(
        leading: Icon(
          CupertinoIcons.folder,
          color:  CupertinoTheme.of(context).textTheme.textStyle.color,
        ),
        title: Text(folder.value.title),
        onTap:enabled ? onTapTile:null,
      );
    } else {
      return AnimatedCustomExpansionTile(
        enabled: sourceId!=folder.id,
          id: folder.id,
          leading: Icon(
            CupertinoIcons.folder,
            color:  CupertinoTheme.of(context).textTheme.textStyle.color,
          ),
          title: Text(folder.value.title),
          trailing: IconButton(
              onPressed: () {
                ref
                    .read(expansionNotifierProvider(folder.id).notifier)
                    .toggle();
              },
              icon: Icon(CupertinoIcons.chevron_down)),
          onTap: onTapTile,
          child: Column(
            // if souceId match folder.id,not show descendants
            children: enabled ?subFolders
                .map((f) => Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: SelectTargetFolderListTile(f,sourceId),
                    ))
                .toList():[],
          ));
    }
  }
}
