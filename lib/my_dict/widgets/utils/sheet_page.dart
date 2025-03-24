import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;

  const CupertinoSheetPage({
    required this.builder,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return CupertinoSheetRoute(
      settings: this,
      builder: builder,
    );
  }
}



class MaterialSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;
  final CapturedThemes? capturedThemes;
  final String? barrierLabel;
  final String? barrierOnTapHint;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final BoxConstraints? constraints;
  final Color? modalBarrierColor;
  final bool isDismissible;
  final bool enableDrag;
  final bool? showDragHandle;
  final bool isScrollControlled;
  final bool? requestFocus;
  final AnimationController? transitionAnimationController;
  final Offset? anchorPoint;
  final bool useSafeArea;
  final AnimationStyle? sheetAnimationStyle;

  const MaterialSheetPage({
    required this.builder,
    this.capturedThemes,
    this.barrierLabel,
    this.barrierOnTapHint,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.constraints,
    this.modalBarrierColor,
    this.isDismissible = true,
    this.enableDrag = true,
    this.showDragHandle,
    required this.isScrollControlled,
    this.requestFocus,
    this.transitionAnimationController,
    this.anchorPoint,
    this.useSafeArea = false,
    this.sheetAnimationStyle,
    RouteSettings? settings,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      builder: builder,
      capturedThemes: capturedThemes,
      barrierLabel: barrierLabel,
      barrierOnTapHint: barrierOnTapHint,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      constraints: constraints,
      modalBarrierColor: modalBarrierColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      isScrollControlled: isScrollControlled,
      settings: this,
      requestFocus: requestFocus,
      transitionAnimationController: transitionAnimationController,
      anchorPoint: anchorPoint,
      useSafeArea: useSafeArea,
      sheetAnimationStyle: sheetAnimationStyle,
    );
  }
}