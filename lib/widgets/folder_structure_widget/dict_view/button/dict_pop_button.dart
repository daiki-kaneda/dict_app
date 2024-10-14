import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/delay_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictPopButton extends ConsumerWidget {
  const DictPopButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DelayWrapper(child:Builder(
      builder: (context) {
        return CupertinoNavigationBarBackButton(
                onPressed: () {
                  ref.read(audioPlayerNotifierProvider.notifier).pause();
                  Navigator.of(context).pop();
                },
              );
      },
    ));
  }
}
