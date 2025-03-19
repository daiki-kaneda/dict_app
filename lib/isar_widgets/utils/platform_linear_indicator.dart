import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformLinearIndicator extends StatelessWidget {
  const PlatformLinearIndicator({
    super.key,
    required this.progress,
    this.backgroundColor,
    this.activeColor,
  });

  final double progress;
  final Color? backgroundColor;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: _PlatformIndicatorBar(
        progress: progress,
        backgroundColor: backgroundColor ??
            (isIOS
                ? CupertinoColors.systemGrey5.resolveFrom(context)
                : Colors.grey[300]!),
        activeColor: activeColor ??
            (isIOS
                ? CupertinoColors.label.resolveFrom(context)
                : Colors.grey[600]!),
      ),
    );
  }
}

class AnimatedPlatformLinearIndicator extends StatelessWidget {
  const AnimatedPlatformLinearIndicator({
    super.key,
    required this.progress,
    this.backgroundColor,
    this.activeColor,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.linear,
  });

  final double progress;
  final Color? backgroundColor;
  final Color? activeColor;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AnimatedIndicatorBar(
        progress: progress,
        backgroundColor: backgroundColor ??
            (isIOS
                ? CupertinoColors.systemGrey5.resolveFrom(context)
                : Colors.grey[300]!),
        activeColor: activeColor ??
            (isIOS
                ? CupertinoColors.label.resolveFrom(context)
                : Colors.grey[600]!),
        duration: duration,
        curve: curve,
      ),
    );
  }
}

class AnimatedPlatformPageViewLinearIndicator extends AnimatedWidget {
  const AnimatedPlatformPageViewLinearIndicator(this.controller, {
    super.key, required this.pageLength,
  }) : super(listenable: controller);

  final int pageLength;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final page = controller.page ?? 0;

    return PlatformLinearIndicator(
      progress: pageLength != 1 ? page / (pageLength - 1) : page,
    );
  }
}

class _PlatformIndicatorBar extends StatelessWidget {
  const _PlatformIndicatorBar({
    super.key,
    required this.progress,
    required this.backgroundColor,
    required this.activeColor,
  });

  final double progress;
  final Color backgroundColor;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return ColorBar(
      color: backgroundColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: progress.clamp(0.0, 1.0),
          child: ColorBar(color: activeColor),
        ),
      ),
    );
  }
}

class AnimatedIndicatorBar extends StatelessWidget {
  const AnimatedIndicatorBar({
    super.key,
    required this.progress,
    required this.backgroundColor,
    required this.activeColor,
    required this.duration,
    required this.curve,
  });

  final double progress;
  final Color backgroundColor;
  final Color activeColor;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedColorBar(
      color: backgroundColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AnimatedFractionallySizedBox(
          widthFactor: progress.clamp(0.0, 1.0),
          duration: duration,
          curve: curve,
          child: AnimatedColorBar(color: activeColor),
        ),
      ),
    );
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

class AnimatedColorBar extends StatelessWidget {
  const AnimatedColorBar({
    super.key,
    required this.color,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.linear,
    this.child,
  });

  final Color? color;
  final Duration duration;
  final Curve curve;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      height: 4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
      child: child,
    );
  }
}