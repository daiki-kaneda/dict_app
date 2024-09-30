
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/tree_list_tile/trailing_button/select_folder_list.dart/select_folder_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TrailingEditButton extends ConsumerWidget {
  const TrailingEditButton(this.treeId, {super.key, this.isTask = false});

  final String treeId;

  final bool isTask;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentId = ref.watch(currentTreeIdNotifierProvider);
    final root = ref.watch(dataTreeNotifierProvider);

    return CupertinoButton(
        onPressed: () {
          ref.watch(isSheetShowingProvider.notifier).updateValue(true);
          showCupertinoModalPopup(
            useRootNavigator: true,
            context: context,
            builder: (context) {
              return CupertinoActionSheet(
                title: Text('Choose an Option'),
                message: Text('Select one of the following options.'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    child: Text('移動'),
                    onPressed: () async{
                      Navigator.of(context).pop();
                      final targetId = await Navigator.of(context).push<String>(
                        CupertinoPageRoute(builder: (context) {
                          return const CupertinoPageScaffold(child:
                          SelectFolderList() 
                          );
                        },)
                      );
                      if(targetId==null)return;
                      if (isTask) {
                        ref
                            .read(dataTreeNotifierProvider.notifier)
                            .moveDict(treeId, targetId);
                      } else {
                        ref
                            .read(dataTreeNotifierProvider.notifier)
                            .moveFolder(treeId, 
                            targetId);
                      }
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: Text('名称変更'),
                    onPressed: () {
                      if (isTask) {
                        ref
                            .read(dataTreeNotifierProvider.notifier)
                            .changeDictName(treeId, 'newName');
                      } else {
                        ref
                            .read(dataTreeNotifierProvider.notifier)
                            .changeFolderName(treeId, 'newName');
                      }
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoActionSheetAction(
                    isDestructiveAction: true,
                    child: Text('Delete'),
                    onPressed: () {
                      Navigator.pop(context);
                      if (isTask) {
                        ref
                            .read(dataTreeNotifierProvider.notifier)
                            .deleteDict(treeId);
                      } else {
                        ref
                            .read(dataTreeNotifierProvider.notifier)
                            .deleteFolder(treeId);
                      }
                    },
                  ),
                ],
                cancelButton: CupertinoActionSheetAction(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
          ).whenComplete(() {
            ref.read(isSheetShowingProvider.notifier).updateValue(false);
          });
        },
        child: const Icon(
          CupertinoIcons.ellipsis,
          color: CupertinoColors.systemGrey,
        ));
  }
}
