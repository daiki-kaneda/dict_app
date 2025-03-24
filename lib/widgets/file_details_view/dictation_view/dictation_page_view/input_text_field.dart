import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InputTextField extends ConsumerStatefulWidget {
  const InputTextField(this.fileId,{super.key});
  final int fileId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends ConsumerState<InputTextField> {
  @override
  Widget build(BuildContext context) {
    ref.watch(typedTextNotifierProvider(widget.fileId));
    final focusNode = ref.watch(inputTextFieldFocusNodeProvider);
    return Opacity(
      opacity: 0,
      child: IgnorePointer(
        child: PlatformTextField(
          maxLines: null,
          maxLength: null,
          autocorrect: false,
          focusNode: focusNode,
          onChanged: (value) {
            if (value.isEmpty) return;
            print(value.characters.lastOrNull ?? '');
            ref
                .read(typedTextNotifierProvider(widget.fileId).notifier)
                .emitText(value);
          },
        ),
      ),
    );
  }
}
