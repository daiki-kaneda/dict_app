import 'package:dict_app/my_dict/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/my_dict/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/my_dict/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDurationWidget extends StatelessWidget {
  const CustomDurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDurationText(isRemain: false),
        CustomDurationText(isRemain: true),
      ],
    );
  }
}

class CustomDurationText extends ConsumerWidget {
  const CustomDurationText({super.key,required this.isRemain});

  final bool isRemain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startAndEndPair = ref.watch(startEndProviderProvider);
    final position = ref.watch(playerPositionProvider);

    final duration = Duration(milliseconds: ((startAndEndPair.end-startAndEndPair.start)*1000).toInt());

    if(position.hasValue){
      if(isRemain){
        return Text(
          '-${formatDuration((duration - position.value!))}',
          style: const TextStyle(color: CupertinoColors.inactiveGray),
        );
      }else{
      return Text(
        formatDuration(position.value!),
        style: const TextStyle(
          color: CupertinoColors.inactiveGray
        ),);
      }
    }else{
      return const SizedBox();
    }
  }
}