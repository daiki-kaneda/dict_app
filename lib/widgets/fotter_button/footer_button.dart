import 'package:dict_app/models/data_tree/folder_metadata.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tree_data_model/tree_data_model.dart';

class FooterButton extends ConsumerWidget {
  const FooterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDictShowing = ref.watch(isDictShowingProvider);
    final isEditing = ref.watch(isEditingNotifierProvider);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (isDictShowing.value == true) ...[
          const SizedBox(),
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.play))
        ],
        if (isDictShowing.value != true && !isEditing) ...[
          IconButton(
              onPressed: () {
                final currentId = ref.read(currentTreeIdNotifierProvider).value;

                if (currentId != null) {
                  ref.read(dataTreeNotifierProvider.notifier).createFolder(
                      currentId,
                      Node(
                          value: FolderMetadata(
                              title: 'newFolder', createdAt: DateTime.now()),
                          subTrees: []));
                }
              },
              icon: const Icon(CupertinoIcons.folder_badge_plus)),
          IconButton(
              onPressed: () {
                final currentId = ref.read(currentTreeIdNotifierProvider).value;
                if (currentId != null) {
                  ref.read(dataTreeNotifierProvider.notifier).
                  addNewDict(nodeId: currentId);
                  // ref.read(dataTreeNotifierProvider.notifier).createTask(
                  //     currentId,
                  //     Leaf(value: DictData(title: 'new', completed: false)));
                }
              },
              icon: const Icon(CupertinoIcons.add))
        ],
        if (isDictShowing.value != true && isEditing) ...[
          IconButton(
              onPressed: () {
                ref.read(dataTreeNotifierProvider.notifier).deleteAll();
              },
              icon: const Icon(CupertinoIcons.delete)),
          IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.share))
        ]
      ],
    );
  }
}
