import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformLinearIndicator extends StatelessWidget {
  const PlatformLinearIndicator(
      {super.key,
      required this.progress,
      this.backgroundColor,
      this.activeColor});

  final double progress;
  final Color? backgroundColor;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ColorBar(
          color: backgroundColor ??
              (isIOS
                  ? CupertinoColors.systemGrey5.resolveFrom(context)
                  : Colors.grey[300]),
          child: Align(
            alignment: Alignment.centerLeft,
            child: FractionallySizedBox(
                widthFactor: progress.clamp(0.0, 1.0),
                child: ColorBar(
                  color: activeColor ??
                      (isIOS
                          ? CupertinoColors.label.resolveFrom(context)
                          : Colors.grey[600]),
                )),
          ),
        ));
  }
}

class ColorBar extends StatelessWidget {
  const ColorBar({super.key, required this.color, this.child});

  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
      child: child,
    );
  }
}

class AnimatedPlatformPageViewLinearIndicator extends AnimatedWidget {
  const AnimatedPlatformPageViewLinearIndicator(this.controller,
      {super.key, required this.pageLength})
      : super(listenable: controller);

  final int pageLength;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final page = controller.page ?? 0;

    return PlatformLinearIndicator(
        progress: pageLength != 1 ? page / (pageLength - 1) : page);
  }
}
