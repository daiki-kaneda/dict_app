import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectButton extends ConsumerWidget {
  const SelectButton(this.treeId,{super.key});

  final String treeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIds = ref.watch(selectedIdsProvider);
    final isSelected = selectedIds.contains(treeId);
    return 
    // Center(
    //   child: 
      IconButton(
      onPressed: (){
        ref.read(selectedIdsProvider.notifier).toggle(treeId);
      },
      icon: Icon(
        isSelected ? CupertinoIcons.check_mark_circled_solid
        :CupertinoIcons.circle),
        color: CupertinoColors.activeBlue
        //)
    );
  }
}