import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformSliderDialog extends StatefulWidget {
  const PlatformSliderDialog(
      {super.key,
      required this.titleBuilder,
      this.initialValue = 0,
      this.min = 0,
      this.max = 1,
      this.leading,
      this.trailing});

  final Widget Function(BuildContext context, double currentValue) titleBuilder;
  final double initialValue;
  final Widget? leading;
  final Widget? trailing;
  final double min;
  final double max;

  @override
  State<PlatformSliderDialog> createState() => _PlatformSliderDialogState();
}

class _PlatformSliderDialogState extends State<PlatformSliderDialog> {
  @override
  void initState() {
    currentValue = widget.initialValue;
    super.initState();
  }

  double currentValue = 0;
  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
        title: widget.titleBuilder(context, currentValue),
        content: Row(
          children: [
            widget.leading ?? Container(),
            Expanded(
              child: PlatformSlider(
                  value: currentValue,
                  min: widget.min,
                  max: widget.max,
                  onChanged: (nextValue) {
                    setState(() {
                      currentValue = nextValue;
                    });
                  }),
            ),
            widget.trailing ?? Container()
          ],
        ),
        actions: [
          PlatformTextButton(
            onPressed: () => Navigator.maybePop(context, null),
            child: Text('Cancel'),
          ),
          PlatformTextButton(
            onPressed: () => Navigator.maybePop(context, currentValue),
            child: Text('OK'),
          )
        ]);
  }
}
