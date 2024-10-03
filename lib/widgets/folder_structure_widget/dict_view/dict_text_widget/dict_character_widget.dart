import 'package:dict_app/models/data_tree/dict_data/dict_problem/dictation_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictCharacterWidget extends ConsumerWidget {
  const DictCharacterWidget(this.character,{super.key});

  final DictationCharacter character;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSolved = character.isSolved;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: AnimatedDefaultTextStyle(
        style: TextStyle(
          color: isSolved ? CupertinoColors.black:CupertinoColors.systemGrey
        ), duration: const Duration(milliseconds: 200),
        child: Text(
          isSolved ? character.character : '-',
          ),),);
  }
}