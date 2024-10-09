import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictCharacterWidget extends ConsumerWidget {
  const DictCharacterWidget(this.character,{super.key});

  final DictationCharacter character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSolved = character.isSolved;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      child: AnimatedDefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: isSolved ? CupertinoColors.black:CupertinoColors.systemGrey
        ), duration: const Duration(milliseconds: 5),
        child: Text(
          isSolved ? character.character : '-',
          ),),);
  }
}