import 'package:dict_app/isar_widgets/file_details_view/player_widget/buttons/hint_fill_button.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/buttons/play_pause_button.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/buttons/speed_button.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_slider/custom_player_slider.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_slider/duration_widget.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerWidget extends ConsumerWidget {
  const PlayerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomPlayerSlider(),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DurationWidget(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const HintFillButton(),
                const PlayPauseButton(),
                const SpeedButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
