import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_character_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictWordWidget extends ConsumerWidget {
  const DictWordWidget(this.index,this.focusNode,{super.key});

  final int index;

  final FocusNode focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final platform = MethodChannel('samples.flutter.dev/dictionary');

    final playerPosition = ref.watch(
      playerPositionProvider.select(
        (positionAsync){
          if(positionAsync.hasValue)return (positionAsync.value!.inMilliseconds)/1000;
          return 0;
        }
      ));
    //final shouldFocus = word.start<=playerPosition && playerPosition<word.end;

    final isSelected = ref.watch(wordIndexNotifierProvider.select(
      (i)=>index==i
    ));

    final word = ref.watch(selectedSentenceProvider.select(
      (sentence)=>sentence.value?.words.elementAtOrNull(index)
    ));
    if(word==null){
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: isSelected ? CupertinoColors.secondarySystemFill.resolveFrom(context):null,
        // border: Border(bottom: 
        // shouldFocus ? BorderSide(
        //   color: CupertinoColors.activeOrange,
        //   width: 2.5
        // ):BorderSide(
        //   color: CupertinoColors.transparent,
        //   width: 2.5
        // )
        // )
      ),
      child: GestureDetector(
        onTap: () {
          if(word.isCompleted){
            focusNode.unfocus();
            platform.invokeMethod('searchDictionary',{'word':word.word});
          }else{
            HapticFeedback.lightImpact();
            ref.read(wordIndexNotifierProvider.notifier).updateIndex(index);
            focusNode.requestFocus();
          }
        },
        onLongPress: () {
          // ref.read(audioPlayerNotifierProvider.notifier).seek(
          //   Duration(milliseconds: (word.start*1000).toInt())
          // );
        },
        onDoubleTap: () {
           //if(word.isCompleted)platform.invokeMethod('searchDictionary',{'word':word.word});
        },
        child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for(final c in word.characters)
          DictCharacterWidget(c)
        ],
      ),
      ),);
  }
}