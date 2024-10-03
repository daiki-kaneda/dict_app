import 'package:dict_app/providers/dict_view_provider/dict_view_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputTextField extends ConsumerStatefulWidget {
  const InputTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends ConsumerState<InputTextField> {
  final focusNode = FocusNode();

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 250))
      .whenComplete(()=>focusNode.requestFocus());
    
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0,
      child: IgnorePointer(
        child: CupertinoTextField(
          maxLines: null,
          maxLength: null,
          autocorrect: false,
          focusNode: focusNode,
          onChanged: (value) {
            if (value.isEmpty) return;
            ref
                .read(typedTextNotifierProvider.notifier)
                .emitText(value);
          },
        ),
      ),
    );
  }
}
