import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformPicker extends StatelessWidget {
  const PlatformPicker({
    super.key,
    required this.itemExtent,
    required this.onSelectedItemChanged,
    required this.children,
    this.scrollController,
    this.diameterRatio,
    this.perspective,
    this.offAxisFraction,
    this.useMagnifier,
    this.magnification,
  });

  final double itemExtent;
  final void Function(int)? onSelectedItemChanged;
  final List<Widget> children;
  final FixedExtentScrollController? scrollController;
  final double? diameterRatio;
  final double? perspective;
  final double? offAxisFraction;
  final bool? useMagnifier;
  final double? magnification;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPicker(
        itemExtent: itemExtent,
        onSelectedItemChanged: onSelectedItemChanged,
        scrollController: scrollController,
        diameterRatio: diameterRatio ?? 1.07, // CupertinoPicker のデフォルト値
        useMagnifier: useMagnifier ?? false, // CupertinoPicker のデフォルト値
        magnification: magnification ?? 1.0, // CupertinoPicker のデフォルト値
        children: children,
      );
    } else {
      return ListWheelScrollView(
        itemExtent: itemExtent,
        onSelectedItemChanged: onSelectedItemChanged,
        controller: scrollController,
        diameterRatio: diameterRatio ?? 2.0, // ListWheelScrollView のデフォルト値
        perspective: perspective ?? 0.003, // ListWheelScrollView のデフォルト値
        offAxisFraction: offAxisFraction ?? 0.0, // ListWheelScrollView のデフォルト値
        useMagnifier: useMagnifier ?? false, // ListWheelScrollView のデフォルト値
        magnification: magnification ?? 1.0, // ListWheelScrollView のデフォルト値
        children: children,
      );
    }
  }
}
