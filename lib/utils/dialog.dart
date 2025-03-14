import 'package:dict_app/isar_widgets/utils/platform_dialog.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';

enum DialogStatus {
  unExpectedError,
  offlineError,
  exceedMaxAudioLengthError;

  Future<void> showCustomDialog(BuildContext context) async {
    String title;
    String description;
    switch (this) {
      case unExpectedError:
        {
          title = 'エラー';
          description = '予期せぬエラーが発生しました🥵';
        }
      case offlineError:
        {
          title = 'エラー';
          description = 'デバイスがオフラインです😓';
        }
      case exceedMaxAudioLengthError:
        {
          title = 'エラー';
          description = 'ディクテーション用の英語の音声は$maxAudioLengthInSeconds秒以内にしてください🥺';
        }
    }
    showNotifyDialog(context, title: title, description: description);
  }
}
