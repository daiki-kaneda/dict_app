import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTextFieldDialog extends StatefulWidget {
  const CupertinoTextFieldDialog(this.initialValue,{super.key});

  final String initialValue;

  @override
  State<CupertinoTextFieldDialog> createState() =>
      _CupertinoTextFieldDialogState();
}

class _CupertinoTextFieldDialogState extends State<CupertinoTextFieldDialog> {
  late TextEditingController controller;

  final focusNode = FocusNode();

  @override
  void initState() {
    controller = TextEditingController(text: widget.initialValue);
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      actions: [
        CupertinoButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: Text(
              "Cancel",
              style: TextStyle(color: CupertinoColors.activeBlue),
            )),
        CupertinoButton(
          onPressed: () => Navigator.of(context).pop(controller.text),
          child: Text(
            "OK",
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ),
      ],
      title: Text('New Name'),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          CupertinoTextField(
            focusNode: focusNode,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
