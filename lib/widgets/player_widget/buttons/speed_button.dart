import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SpeedButton extends ConsumerStatefulWidget {
  const SpeedButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SpeedButtonState();
}

class _SpeedButtonState extends ConsumerState<SpeedButton> {
  SpeedStatus status=SpeedStatus.normal;

  @override
  Widget build(BuildContext context) {
    
    return TextButton(
      onPressed: () {
        setState(() {
          switch (status) {
            case SpeedStatus.verySlow:
              status = SpeedStatus.slow;
              break;
            case SpeedStatus.slow:
              status = SpeedStatus.normal;
              break;
            case SpeedStatus.normal:
              status = SpeedStatus.fast;
              break;
            case SpeedStatus.fast:
              status = SpeedStatus.veryFast;
              break;
            case SpeedStatus.veryFast:
              status = SpeedStatus.verySlow;
              break;
          }
        });
        ref.read(audioPlayerNotifierProvider.notifier).setPlayBackrate(status);
      },
      child: Text(
        '×${status.rate}',
        style: const TextStyle(
          color: CupertinoColors.activeBlue,
        ),),
    );
}
}