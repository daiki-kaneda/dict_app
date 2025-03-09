import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ActionSheetAction {
  const ActionSheetAction(
    this.title, {
    required this.onTap,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });

  final String title;
  final VoidCallback onTap;
  final bool isDefaultAction;
  final bool isDestructiveAction;
}

class CustomActionSheet extends StatelessWidget {
  const CustomActionSheet({
    super.key,
    this.title,
    this.message,
    this.actions = const [],
    this.hasCancelButton=true,
    this.isCupertino = false,
    this.cancelLabel = 'Cancel'
  });

  final String? title;
  final String? message;
  final List<ActionSheetAction> actions;
  final bool hasCancelButton;
  final bool isCupertino;
  final String cancelLabel;

  @override
  Widget build(BuildContext context) {
    if (isCupertino) {
      return CupertinoActionSheet(
        title: title != null ? Text(title!) : null,
        message: message != null ? Text(message!) : null,
        actions: actions
            .map(
              (a) => CupertinoActionSheetAction(
                isDefaultAction: a.isDefaultAction,
                isDestructiveAction: a.isDestructiveAction,
                onPressed: () {
                  _safePop(context);
                  a.onTap();
                },
                child: Text(
                  a.title,
                  style:TextStyle(
                    color:  a.isDestructiveAction ? CupertinoColors.destructiveRed: Platform.isIOS ? CupertinoColors.activeBlue :null
                    ),),
              ),
            )
            .toList(),
        cancelButton: hasCancelButton
            ? CupertinoActionSheetAction(
                isDefaultAction: true,
                onPressed: () => _safePop(context),
                child: Text(cancelLabel,style:TextStyle(color: Platform.isIOS ? CupertinoColors.activeBlue :null),),
              )
            : null,
      );
    } else {
      return MaterialActionSheet(
        title: title,
        message: message,
        actions: actions,
      );
    }
  }
}

class MaterialActionSheet extends StatelessWidget {
  const MaterialActionSheet({
    super.key,
    this.title,
    this.message,
    this.actions = const [],
  });

  final String? title;
  final String? message;
  final List<ActionSheetAction> actions;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title!,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
          if (message != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                message!,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ...actions
              .map(
                (a) => ListTile(
                  title: Text(
                    a.title,
                    style: TextStyle(
                      color: a.isDestructiveAction
                          ? Colors.red
                          : Theme.of(context).textTheme.bodyLarge?.color,
                      fontWeight:
                          a.isDefaultAction ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    _safePop(context);
                    a.onTap();
                  },
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

/// 安全に Navigator.pop を呼び出す共通ロジック
void _safePop(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}

void showCustomActionSheet({
  required BuildContext context,
  String? title,
  String? message,
  List<ActionSheetAction> actions = const [],
  bool hasCancelButton = true,
  bool isCupertino = false,
}) {
  showPlatformModalSheet(
    context: context,
    builder: (context) => CustomActionSheet(
      title: title,
      message: message,
      actions: actions,
      hasCancelButton: hasCancelButton,
      isCupertino: isCupertino,
    ),
    material: MaterialModalSheetData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      useSafeArea: true
      )
  );
}