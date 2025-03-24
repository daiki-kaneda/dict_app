import 'package:dict_app/my_dict/providers/audio_player_provider/audio_player_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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
    
    return PlatformTextButton(
      onPressed: () {
        setState(() {
          switch (status) {
            case SpeedStatus.slow2:
              status = SpeedStatus.slow1;
              break;
            case SpeedStatus.slow1:
              status = SpeedStatus.normal;
              break;
            case SpeedStatus.normal:
              status = SpeedStatus.fast2;
              break;
            case SpeedStatus.fast2:
              status = SpeedStatus.fast1;
              break;
            case SpeedStatus.fast1:
              status = SpeedStatus.slow2;
              break;
          }
        });
        ref.read(audioPlayerNotifierProvider.notifier).setPlayBackrateByStatus(status);
      },
      child: Text(
        '×${status.rate}',
        style: const TextStyle(
          color: CupertinoColors.activeBlue,
        ),),
    );
}
}