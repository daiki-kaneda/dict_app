import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletenessIcon extends StatelessWidget {
  const CompletenessIcon(this.isCompleted,{super.key});

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Platform.isIOS ? CupertinoIcons.circle :Icons.circle,
      color: isCompleted ? CupertinoColors.systemGreen:CupertinoColors.systemGrey);
  }
}