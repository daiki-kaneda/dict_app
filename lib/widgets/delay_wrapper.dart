import 'package:flutter/cupertino.dart';

class DelayWrapper extends StatefulWidget {
  const DelayWrapper({super.key,
  required this.child,
  this.duration=1000});

  final Widget child;
  final int duration;

  @override
  State<DelayWrapper> createState() => _DelayWrapperState();
}

class _DelayWrapperState extends State<DelayWrapper> {
  bool showing = false;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds:widget.duration )).whenComplete(() {
      if (!mounted) return;
      setState(() {
        showing = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (showing) {
      return widget.child;
    } else {
      return SizedBox();
    }
  }
}
