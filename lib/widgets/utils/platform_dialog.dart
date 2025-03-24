import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Future<bool?> showConfirmDialog(BuildContext context,
    {required String title,
    required String description,
    String cancelLabel = 'Cancel',
    String okLabel = 'OK'}) async {
  return showAdaptiveDialog<bool?>(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(title),
        content: Text(description),
        actions: [
          PlatformTextButton(
            child: Text(cancelLabel),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          PlatformTextButton(
            child: Text(okLabel),
            onPressed: () => Navigator.of(context).pop(true),
          )
        ],
      );
    },
  );
}

Future<void> showNotifyDialog(BuildContext context,
    {required String title,
    required String description,
    String okLabel = 'OK'}) async {
  return showAdaptiveDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog.adaptive(
        title: Text(title),
        content: Text(description),
        actions: [
          PlatformTextButton(
            child: Text(okLabel),
            onPressed: () {
              if (Navigator.canPop(context)) Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
