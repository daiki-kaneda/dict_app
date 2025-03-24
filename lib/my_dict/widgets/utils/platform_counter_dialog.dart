import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformCounterDialog extends StatefulWidget {
  const PlatformCounterDialog(
      {super.key, 
      required this.titleBuilder, 
      this.initialValue = 0,
      this.min = -9999,
      this.max = 9999});

  final int initialValue;
  final int min;
  final int max;
  final Widget Function(BuildContext context, int currentValue) titleBuilder;

  @override
  State<PlatformCounterDialog> createState() => _PlatformCounterDialogState();
}

class _PlatformCounterDialogState extends State<PlatformCounterDialog> {
  int currentCount = 0;

  @override
  void initState() {
    currentCount = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformAlertDialog(
        title: widget.titleBuilder(context, currentCount),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            PlatformIconButton(
              onPressed:currentCount>widget.min ? () {
                setState(() {
                  currentCount--;
                });
              }:null,
              icon: Icon(PlatformIcons(context).remove),
            ),
            FittedBox(
              child: Text(currentCount.toString()),
            ),
            PlatformIconButton(
              onPressed:currentCount<widget.max ? () {
                setState(() {
                  currentCount++;
                });
              }:null,
              icon: Icon(PlatformIcons(context).add),
            ),
          ],
        ),
        actions: [
          PlatformTextButton(
            onPressed: () => Navigator.maybePop(context, null),
            child: Text('Cancel'),
          ),
          PlatformTextButton(
            onPressed: () => Navigator.maybePop(context, currentCount),
            child: Text('OK'),
          )
        ]);
  }
}

Future<int?> showPlatformCounterDialog(BuildContext context,
    {required Widget Function(BuildContext context, int currentValue)
        titleBuilder,
    int initialValue = 0,
    int min = -9999,
    int max = 9999}) async {
  return showPlatformDialog(
    context: context,
    builder: (context) {
      return PlatformCounterDialog(
        titleBuilder: titleBuilder,
        initialValue: initialValue,
        min: min,
        max: max,
      );
    },
  );
}
