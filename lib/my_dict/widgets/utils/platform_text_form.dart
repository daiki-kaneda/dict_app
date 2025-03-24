import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformTextFieldDialog extends StatefulWidget {
  const PlatformTextFieldDialog({
    super.key,
    this.initialValue = '',
    this.cancelLabel = 'Cancel',
    this.okLabel = 'OK',
    required this.title,
  });

  final String initialValue;
  final String title;
  final String cancelLabel;
  final String okLabel;

  @override
  State<PlatformTextFieldDialog> createState() =>
      _PlatformTextFieldDialogState();
}

class _PlatformTextFieldDialogState extends State<PlatformTextFieldDialog> {
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
    return PlatformAlertDialog(
      actions: [
        PlatformTextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: Text(
              widget.cancelLabel,
              style: TextStyle(
                  color: Platform.isIOS ? CupertinoColors.activeBlue : null),
            )),
        PlatformTextButton(
          onPressed: () => Navigator.of(context).pop(controller.text),
          child: Text(
            widget.okLabel,
            style: TextStyle(
                color: Platform.isIOS ? CupertinoColors.activeBlue : null),
          ),
        ),
      ],
      title: Text(widget.title),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          PlatformTextField(
            focusNode: focusNode,
            controller: controller,
          ),
        ],
      ),
    );
  }
}

class PlatformTextSheet extends StatefulWidget {
  const PlatformTextSheet(
      {super.key,
      this.initialValue = '',
      this.sheetTitle = '',
      this.placeholder = '',
        this.cancelLabel = 'Cancel',
    this.okLabel = 'OK',});

  final String initialValue;
  final String sheetTitle;
  final String placeholder;
  final String cancelLabel;
  final String okLabel;

  @override
  State<PlatformTextSheet> createState() => _PlatformTextSheetState();
}

class _PlatformTextSheetState extends State<PlatformTextSheet> {
  late TextEditingController textController;

  final focusNode = FocusNode();

  @override
  void initState() {
    textController = TextEditingController(text: widget.initialValue);
    focusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      backgroundColor: Platform.isIOS ? CupertinoColors.systemBackground.resolveFrom(context) : null,
      material: (context, platform) =>
          MaterialScaffoldData(resizeToAvoidBottomInset: true),
      cupertino: (context, platform) =>
          CupertinoPageScaffoldData(resizeToAvoidBottomInset: true),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlatformTextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) Navigator.of(context).pop(null);
                  },
                  child: Text(
                    widget.cancelLabel,
                    style: TextStyle(
                        color:
                            Platform.isIOS ? CupertinoColors.activeBlue : null),
                  ),
                ),
                PlatformTextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.of(context).pop(textController.text);
                    }
                  },
                  child: Text(
                    widget.okLabel,
                    style: TextStyle(
                        color:
                            Platform.isIOS ? CupertinoColors.activeBlue : null),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child:
                  // SingleChildScrollView(child:
                  Padding(
            padding: const EdgeInsets.all(8),
            child: PlatformTextField(
              controller: textController,
              maxLines: null,
              minLines: null,
              expands: true,
              cupertino: (context, platform) =>
                  CupertinoTextFieldData(
                    placeholder: widget.placeholder,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: BoxDecoration(border: Border.all(color: Colors.transparent))
                    ),
              material: (context, platform) => MaterialTextFieldData(
                  decoration: InputDecoration(
                    hintText: widget.placeholder,
                    border: InputBorder.none)),
            ),
          )
              // )
              )
        ],
      ),
    );
  }
}
