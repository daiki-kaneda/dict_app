import 'package:dict_app/my_dict/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/my_dict/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/my_dict/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DurationText(isRemain: false),
        DurationText(isRemain: true),
      ],
    );
  }
}

class DurationText extends ConsumerWidget {
  const DurationText({super.key,required this.isRemain});

  final bool isRemain;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final duration = ref.watch(playerDurationProvider);
    final position = ref.watch(playerPositionProvider);

    if(duration.hasValue&&position.hasValue){
      if(isRemain){
        return Text(
          '-${formatDuration((duration.value! - position.value!))}',
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