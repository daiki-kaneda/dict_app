import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HintFillButton extends ConsumerWidget {
  const HintFillButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return PlatformIconButton(
      onPressed: (){
        final currentId = ref.read(currentTreeIdNotifierProvider);
        if(currentId.value==null)return;
        final paragraphIndex = ref.read(paragraphIndexNotifierProvider);
        final sentenceIndex = ref.read(sentenceIndexNotifierProvider);
        final wordIndex = ref.read(wordIndexNotifierProvider);
        ref.read(dataTreeNotifierProvider.notifier)
        .tryCharacter(
          input: '', 
          dictId: currentId.value!, 
          paragraphIndex: paragraphIndex, 
          sentenceIndex: sentenceIndex, 
          wordIndex: wordIndex,
          solveAnyway: true);
      },
      icon: Icon(
        CupertinoIcons.eye_fill,
        color: CupertinoColors.label.resolveFrom(context)),);
  }
}