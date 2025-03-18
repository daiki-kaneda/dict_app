import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/dictation_page/dict_sentence_widget/dict_character_widget.dart';
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictWordWidget extends ConsumerWidget {
  const DictWordWidget( this.fileId,{super.key,
  required this.index,
  required this.word});

  final int fileId;
  final int index;
  final DictationWord word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final platform = MethodChannel('samples.flutter.dev/dictionary');

    // final playerPosition = ref.watch(
    //   playerPositionProvider.select(
    //     (positionAsync){
    //       if(positionAsync.hasValue)return (positionAsync.value!.inMilliseconds)/1000;
    //       return 0;
    //     }
    //   ));
    //final shouldFocus = word.start<=playerPosition && playerPosition<word.end;

    final isSelected =
        ref.watch(currentWordIndexProvider(fileId).select((i) => index == i));

    // final word = ref
    //     .watch(currentSentenceIndexProvider.notifier)
    //     .getCurrentSentence()
    //     ?.words?[index];
    // if (word == null) {
    //   return Center(
    //     child: PlatformCircularProgressIndicator(),
    //   );
    // }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: isSelected
            ? CupertinoColors.secondarySystemFill.resolveFrom(context)
            : null,
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
          if (word.isCompleted) {
            ref.read(inputTextFieldFocusNodeProvider.notifier).unfocus();
            platform.invokeMethod('searchDictionary', {'word': word.word});
          } else {
            HapticFeedback.lightImpact();
            ref.read(currentWordIndexProvider(fileId).notifier).updateIndex(index);
            ref.read(inputTextFieldFocusNodeProvider.notifier).requestFocus();
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
            for (final c in word.characters ?? []) DictCharacterWidget(fileId,c)
          ],
        ),
      ),
    );
  }
}
