import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/dict_view_provider/dict_view_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PopButton extends ConsumerWidget{
  const PopButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canPop = ref.watch(canPopProvider);
    return canPop.value==true ? CupertinoNavigationBarBackButton(
              onPressed: () {
                ref
                    .read(currentTreeIdNotifierProvider.notifier)
                    .updateToParentId();
                ref.read(isEditingNotifierProvider.notifier)
                .updateMode(false);
                ref.read(selectedIdsProvider.notifier)
                .clear();
                ref.read(inputTextFieldFocusNodeProvider.notifier)
                .unfocus();
                ref.read(audioPlayerNotifierProvider.notifier).pause();
                Navigator.of(context).pop();
              },
            ):const SizedBox();
  }
}