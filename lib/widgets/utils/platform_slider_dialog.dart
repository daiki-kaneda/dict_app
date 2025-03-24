import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformSliderDialog extends StatefulWidget {
  const PlatformSliderDialog(
      {super.key,
      required this.titleBuilder,
      this.onChanged,
      this.initialValue = 0,
      this.min = 0,
      this.max = 1,
      this.leading,
      this.trailing});

  final Widget Function(BuildContext context, double currentValue) titleBuilder;
  final void Function(double)? onChanged;
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
        content: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              widget.leading ?? Container(),
              Expanded(
                child: PlatformSlider(
                    value: currentValue,
                    min: widget.min,
                    max: widget.max,
                    onChanged: (nextValue) {
                      final onChanged = widget.onChanged;
                      if (onChanged != null) onChanged(nextValue);
                      setState(() {
                        currentValue = nextValue;
                      });
                    }),
              ),
              widget.trailing ?? Container()
            ],
          ),
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

Future<double?> showPlatformSliderDialog(BuildContext context,
    {required Widget Function(BuildContext context, double currentValue)
        titleBuilder,
    void Function(double)? onChanged,
    double initialValue = 0,
    double min = 0,
    double max = 1,
    Widget? leading,
    Widget? trailing}) async {
  return showPlatformDialog(
    context: context,
    builder: (context) {
      return PlatformSliderDialog(
        titleBuilder: titleBuilder,
        onChanged: onChanged,
        initialValue: initialValue,
        min: min,
        max: max,
        leading: leading,
        trailing: trailing,
      );
    },
  );
}
