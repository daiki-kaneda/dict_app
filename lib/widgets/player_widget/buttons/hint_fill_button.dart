import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HintFillButton extends ConsumerWidget {
  const HintFillButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentId = ref.watch(currentTreeIdNotifierProvider);
    return CupertinoButton(
      onPressed: (){
        if(currentId.value==null)return;
        // ref.read(dataTreeNotifierProvider.notifier)
        // .fillWord(dictId: currentId.value!);
      },
      child: Icon(
        CupertinoIcons.eye_fill,
        color: CupertinoColors.black,),);
  }
}