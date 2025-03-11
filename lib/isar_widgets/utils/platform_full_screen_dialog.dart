import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showPlatformFullScreenDialog(BuildContext context, {required Widget child}) async {
  if (Platform.isIOS) {
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return CupertinoFullscreenDialogTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: secondaryAnimation,
            linearTransition: true,
            child: child,
          );
        },
      ),
    );
  } else {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => child,
        fullscreenDialog: true,
      ),
    );
  }
}