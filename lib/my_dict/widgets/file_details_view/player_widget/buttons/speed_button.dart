import 'package:dict_app/my_dict/widgets/utils/platform_slider_dialog.dart';
import 'package:dict_app/my_dict/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/my_dict/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class SpeedButton extends ConsumerWidget {
  const SpeedButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioSpeed =
        ref.watch(settingNotifierProvider.selectAsync((s) => s.audioSpeed));

    String formatSpeedRate(double rate) {
      return '×${NumberFormat('0.0').format(rate)}';
    }

    return FutureBuilder(
      future: audioSpeed,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PlatformTextButton(
              onPressed: () async {
                final newSpeed = await showPlatformSliderDialog(context,
                    initialValue: snapshot.data!,
                    titleBuilder: (context, currentValue) =>
                        Text(formatSpeedRate(currentValue)),
                    min: 0.5,
                    max: 2.0);
                if (newSpeed != null) {
                  ref
                      .read(settingNotifierProvider.notifier)
                      .updateSetting(audioSpeed: newSpeed);
                  ref
                      .read(audioPlayerNotifierProvider.notifier)
                      .setPlaybackRate(newSpeed);
                  print(newSpeed);
                }
              },
              child: Text(formatSpeedRate(snapshot.data!)));
        } else {
          return Container();
        }
      },
    );
  }
}
