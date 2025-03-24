import 'package:dict_app/widgets/file_details_view/player_widget/buttons/play_pause_button.dart';
import 'package:dict_app/widgets/file_details_view/player_widget/player_slider/custom_player_slider.dart';
import 'package:dict_app/widgets/file_details_view/player_widget/player_slider/duration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerWidget extends ConsumerWidget {
  const PlayerWidget(
    this.fileId, {
    super.key,
    this.leadingActions = const [],
    this.trailingActions = const [],
  });

  final int fileId;
  final List<Widget> leadingActions;
  final List<Widget> trailingActions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: DurationWidget(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...leadingActions,
                  ],
                )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: PlayPauseButton(),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [...trailingActions],
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
