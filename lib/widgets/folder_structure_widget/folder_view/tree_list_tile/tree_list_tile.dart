import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_structure_widget.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/select_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/trailing_button/trailing_button.dart';
import 'package:dict_app/widgets/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TreeListTile extends ConsumerWidget {
  const TreeListTile(this.tree, {super.key});

  final DataTree tree;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingNotifierProvider);
    // final selectedIds = ref.watch(selectedIdsProvider);

    Future<void> pushRoute(String treeId) async {
      Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) {
          return FolderStructureWidget(treeId);
        },
      ));
      ref.read(isEditingNotifierProvider.notifier).updateMode(false);
      ref.read(currentTreeIdNotifierProvider.notifier).updateId(treeId);
    }

    void onTap(String treeId) {
      if (isEditing) {
        ref.read(selectedIdsProvider.notifier).toggle(treeId);
      } else {
        pushRoute(treeId);
      }
    }

    switch (tree) {
      case Dict():
        {
          final dict = tree as Dict;
          return ListTile(
            leading: isEditing ? SelectButton(dict.id) : CompletenessIcon(dict.value.paragraphs.isCompleted),
            title: Text(
              dict.value.title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(formatDateTime(dict.value.createdAt)),
            onTap: isEditing
                ? null
                : () {
                    onTap(dict.id);
                    ref
                        .read(audioPlayerNotifierProvider.notifier)
                        .setSource(dict.value.audioPath);
                  },
            trailing: TrailingEditButton(
              dict.id,
              isTask: true,
            ),
          );
        }
      case Folder():
        {
          final folder = tree as Folder;
          return ListTile(
            leading: Icon(
              CupertinoIcons.folder,
              color: CupertinoTheme.of(context).textTheme.textStyle.color,
            ),
            title: Text(folder.value.title),
            trailing: TrailingEditButton(folder.id),
            onTap: isEditing
                ? null
                : () {
                    onTap(folder.id);
                  },
          );
        }
    }
  }
}
