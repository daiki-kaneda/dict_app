import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class EditButton extends ConsumerWidget {
  const EditButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingNotifierProvider);
    return TextButton(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory
      ),
      onPressed: (){
        ref.read(isEditingNotifierProvider.notifier)
        .updateMode(!isEditing);
      }, child: Text(
        isEditing ? 'Cancel' : 'Edit'
      ,style: TextStyle(color: CupertinoColors.activeBlue),));
  }
}