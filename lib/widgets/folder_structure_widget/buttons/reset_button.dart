import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/delay_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetButton extends ConsumerWidget {
  const ResetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentId = ref.watch(currentTreeIdNotifierProvider);

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
                        if (currentId.value != null) {
                          ref
                              .read(dataTreeNotifierProvider.notifier)
                              .resetProblem(
                                currentId.value!,
                              );
                        }
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
