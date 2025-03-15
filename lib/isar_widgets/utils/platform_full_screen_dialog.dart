import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

Future<dynamic> showPlatformFullScreenDialog(BuildContext context,
    {required Widget child}) async {
  return Navigator.of(context).push<dynamic>(Platform.isIOS
      ? CupertinoPageRoute(
        builder: (context) => child,
        fullscreenDialog: true)
      : MaterialPageRoute(
          builder: (context) => child,
          fullscreenDialog: true,
        ));
}
