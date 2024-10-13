import 'package:dict_app/constants/inner_navigator_key.dart';
import 'package:dict_app/constants/scaffold_key.dart';
import 'package:flutter/cupertino.dart';

enum DialogStatus {
  unExpectedError,
}

Future<void> showCustomDialog(DialogStatus status) async {
  if (status == DialogStatus.unExpectedError) {
    showCupertinoDialog(
      useRootNavigator: true,
      context: innerNavigatorKey.currentContext!,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('エラー'),
          content: Text('予期せぬエラーが発生しました'),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
