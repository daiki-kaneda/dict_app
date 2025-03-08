import 'package:dict_app/widgets/player_widget/buttons/hint_fill_button.dart';
import 'package:dict_app/widgets/player_widget/buttons/play_pause_button.dart';
import 'package:dict_app/widgets/player_widget/buttons/speed_button.dart';
import 'package:dict_app/widgets/player_widget/player_slider/custom_player_slider.dart';
import 'package:dict_app/widgets/player_widget/player_slider/duration_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LayoutBuilder(builder:(context, constraints) {
          final biggest = constraints.biggest;
          return SizedBox(
            width: biggest.width,
            height: 1,
          );
        },),
         const CustomPlayerSlider(),
         const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child:  DurationWidget(),),

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
          ),)
      ],
    );
  }
}