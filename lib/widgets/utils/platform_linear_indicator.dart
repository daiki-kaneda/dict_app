import 'package:flutter/material.dart';

class PlatformLinearIndicator extends StatelessWidget {
  const PlatformLinearIndicator({
    super.key,
    required this.progress,
    this.backgroundColor = Colors.grey, 
    this.activeColor = Colors.green,    
    this.height = 4.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
  });

  final double progress;
  final Color backgroundColor;
  final Color activeColor;
  final double height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ColorBar(
        height: height,
        color: backgroundColor,
        child: Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: progress.clamp(0.0, 1.0),
            child: ColorBar(
              height: height,
              color: activeColor,
            ),
          ),
        ),
      ),
    );
  }
}

class ColorBar extends StatelessWidget {
  const ColorBar({
    super.key,
    required this.color,
    this.height = 4.0,
    this.child,
  });

  final Color color;
  final double height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
      child: child,
    );
  }
}

class AnimatedPlatformPageViewLinearIndicator extends AnimatedWidget {
  const AnimatedPlatformPageViewLinearIndicator(
    this.controller, {
    super.key,
    required this.pageLength,
    this.height = 4.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
  }) : super(listenable: controller);

  final int pageLength;
  final PageController controller;
  final double height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final page = controller.page ?? 0;

    return PlatformLinearIndicator(
      progress: pageLength != 1 ? page / (pageLength - 1) : page,
      height: height,
      padding: padding,
    );
  }
}

class AnimatedPlatformLinearIndicator extends StatelessWidget {
  const AnimatedPlatformLinearIndicator({
    super.key,
    required this.progress,
    this.backgroundColor = Colors.grey,
    this.activeColor = Colors.green,     
    this.height = 4.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.linear,
  });

  final double progress;
  final Color backgroundColor;
  final Color activeColor;
  final double height;
  final EdgeInsetsGeometry padding;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: AnimatedColorBar(
        height: height,
        color: backgroundColor,
        child: Align(
          alignment: Alignment.centerLeft,
          child: AnimatedFractionallySizedBox(
            curve: curve,
            duration: duration,
            widthFactor: progress.clamp(0.0, 1.0),
            child: AnimatedColorBar(
              height: height,
              color: activeColor,
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedColorBar extends StatelessWidget {
  const AnimatedColorBar({
    super.key,
    required this.color,
    this.height = 4.0,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.linear,
    this.child,
  });

  final Color color;
  final double height;
  final Duration duration;
  final Curve curve;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
      child: child,
    );
  }
}
