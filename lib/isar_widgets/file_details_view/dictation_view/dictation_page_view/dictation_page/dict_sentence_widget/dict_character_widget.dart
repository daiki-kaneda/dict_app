
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictCharacterWidget extends ConsumerWidget {
  const DictCharacterWidget(this.fileId,this.character,{super.key});

  final int fileId;
  final DictationCharacter character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showErrorEffect = ref.watch(ShowErrorEffectProvider(fileId));
    final isSolved = character.isSolved;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      child: AnimatedDefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: showErrorEffect ? 
          CupertinoColors.systemPink.resolveFrom(context):
          (isSolved ? CupertinoTheme.of(context).textTheme.textStyle.color:CupertinoColors.systemGrey),
        ), duration: const Duration(milliseconds: 50),
        child: Text(
          isSolved ? character.character ?? '' : '-',
          ),),);
  }
}