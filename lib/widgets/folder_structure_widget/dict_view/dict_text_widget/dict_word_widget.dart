import 'package:dict_app/models/data_tree/dict_data/dict_problem/dictation_data_model.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_text_widget/dict_character_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictWordWidget extends ConsumerWidget {
  const DictWordWidget(this.word,{super.key});

  final DictationWord word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerPosition = ref.watch(
      playerPositionProvider.select(
        (positionAsync){
          if(positionAsync.hasValue)return (positionAsync.value!.inMilliseconds)/1000;
          return 0;
        }
      ));

    final shouldFocus = word.start<=playerPosition && playerPosition<=word.end;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        border: Border(bottom: 
        shouldFocus ? BorderSide(
          color: CupertinoColors.black
        ):BorderSide.none
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for(final c in word.characters)
          DictCharacterWidget(c)
        ],
      ),);
  }
}