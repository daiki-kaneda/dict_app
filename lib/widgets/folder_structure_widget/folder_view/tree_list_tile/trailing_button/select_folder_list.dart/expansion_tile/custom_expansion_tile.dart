import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnimatedCustomExpansionTile extends ConsumerStatefulWidget {
  const AnimatedCustomExpansionTile(
      {super.key,
      required this.id,
      required this.title,
      this.leading,
      this.subtitle,
      this.trailing,
      this.tileColor,
      this.selectedColor,
      this.onTap,
      this.enabled = true,
      this.initialExpand=true,
      required this.child,
      Duration? duration})
      : animationDuration = duration ?? const Duration(milliseconds: 200);

  final String id;
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final Color? tileColor;
  final Color? selectedColor;
  final bool enabled;
  final bool initialExpand;
  final void Function()? onTap;

  final Widget child;
  final Duration animationDuration;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnimatedCustomExpansionTileState();
}

class _AnimatedCustomExpansionTileState
    extends ConsumerState<AnimatedCustomExpansionTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, value:widget.initialExpand ? 1.0 : 0.0, duration: widget.animationDuration);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(ExpansionNotifierProvider(widget.id));
    ref.listen(expansionNotifierProvider(widget.id).select((value) => value),
        (prev, next) {
      if (next == true) {
        _controller.forward();
      }
      if (next == false) {
        _controller.reverse();
      }
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PlatformListTile(
          title: widget.title,
          leading: widget.leading,
          subtitle: widget.subtitle,
          trailing: widget.trailing,
          onTap: widget.enabled ? widget.onTap : null,
          material: (context, platform) => MaterialListTileData(
            tileColor: widget.tileColor,
            selectedColor: widget.selectedColor,
            enabled: widget.enabled,
          ),
          cupertino: (context, platform) => CupertinoListTileData(
            backgroundColor: widget.tileColor,
            backgroundColorActivated: widget.selectedColor,
          ),
        ),
        ExpansionAnimatedWidget(_controller, child: widget.child),
      ],
    );
  }
}

class ExpansionAnimatedWidget extends AnimatedWidget {
  ExpansionAnimatedWidget(this.controller, {super.key, required this.child})
      : super(listenable: controller..drive(CurveTween(curve: Curves.easeIn)));

  final AnimationController controller;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        clipper: MyClipper(controller.value),
        child: Align(
          heightFactor: controller.value,
          child: Opacity(
            opacity: controller.status == AnimationStatus.reverse
                ? 0.0
                : controller.value,
            child: child,
          ),
        ));
  }
}

class MyClipper extends CustomClipper<Rect> {
  const MyClipper(this.heightFactor);

  final double heightFactor;
  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, size.height * heightFactor);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
