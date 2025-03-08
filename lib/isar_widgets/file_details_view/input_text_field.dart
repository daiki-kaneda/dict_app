import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputTextField extends ConsumerStatefulWidget {
  const InputTextField(this.focusNode,{super.key});

  final FocusNode focusNode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends ConsumerState<InputTextField> {

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0,
      child: IgnorePointer(
        child: CupertinoTextField(
          maxLines: null,
          maxLength: null,
          autocorrect: false,
          focusNode: widget.focusNode,
          onChanged: (value) {
            if (value.isEmpty) return;
            // ref
            //     .read(typedTextNotifierProvider.notifier)
            //     .emitText(value);
          },
        ),
      ),
    );
  }
}
