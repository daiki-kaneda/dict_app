import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/dict_view_provider/dict_view_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PopButton extends ConsumerStatefulWidget {
  const PopButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PopButtonState();
}

class _PopButtonState extends ConsumerState<PopButton> {
  bool showing = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000))
    .whenComplete((){
      if(!mounted)return;
      setState(() {
        showing=true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final canPop = ref.watch(canPopProvider);
    return canPop.value==true && showing? 
    CupertinoNavigationBarBackButton(
              onPressed: () {
                ref
                    .read(currentTreeIdNotifierProvider.notifier)
                    .updateToParentId();
                ref.read(isEditingNotifierProvider.notifier)
                .updateMode(false);
                ref.read(selectedIdsProvider.notifier)
                .clear();
                // ref.read(inputTextFieldFocusNodeProvider.notifier)
                // .unfocus();
                ref.read(audioPlayerNotifierProvider.notifier).pause();
                Navigator.of(context).pop();
              },
            )
            :const SizedBox();
  }
}