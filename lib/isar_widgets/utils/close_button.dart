import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({super.key, required this.onPop});

  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      padding: Platform.isIOS ? EdgeInsets.zero : null,
      onPressed: () {
        Navigator.of(context).maybePop();
        onPop();
      },
      child: const Text('Close'),
    );
  }
}
