import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/delay_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ResetStatus{
  paragraphs,paragraph,sentence
}

class ResetButton extends ConsumerWidget {
  const ResetButton(this.status,{super.key});

  final ResetStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    void reset(){
      final notifier = ref.read(dataTreeNotifierProvider.notifier);
      final currentId = ref.watch(currentTreeIdNotifierProvider);
      final paragraphIndex = ref.watch(paragraphIndexNotifierProvider);
      final sentenceIndex = ref.watch(sentenceIndexNotifierProvider);

      if(currentId.value==null)return;
      if(status==ResetStatus.paragraphs){
        notifier.resetParagraphs(dictId: currentId.value!);
      }else if(status==ResetStatus.paragraph){
        notifier.resetParagraph(dictId: currentId.value!, paragraphIndex: paragraphIndex);
      }else{
        notifier.resetSentence(dictId: currentId.value!, paragraphIndex: paragraphIndex,sentenceIndex: sentenceIndex);
      }
    }

    return DelayWrapper(
      duration: 2500,
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('確認'),
                  content: Text('全ての進捗をリセットしますか？'),
                  actions: [
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      child: Text('キャンセル'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoDialogAction(
                      isDestructiveAction: true,
                      child: Text('リセット'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        reset();
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Icon(
            CupertinoIcons.refresh,
            size: 30,
          )),
    );
  }
}
