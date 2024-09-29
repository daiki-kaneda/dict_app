import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FolderTrailingWidget extends ConsumerWidget {
  const FolderTrailingWidget(this.folder,{super.key});

  final Folder folder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingNotifierProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if(isEditing)
        CupertinoButton(
          onPressed: (){
            
          },
          child: const Icon(
            CupertinoIcons.ellipsis_circle,
            color: CupertinoColors.activeBlue,),),
        if(!isEditing)
        ...[
          Text(
          '${folder.subTrees.whereType<Dict>().length}',
          style: const TextStyle(color: CupertinoColors.systemGrey),
        ),
        const Icon(
          CupertinoIcons.chevron_right,
          color: CupertinoColors.systemGrey,
        )]
      ],
    );
  }
}
