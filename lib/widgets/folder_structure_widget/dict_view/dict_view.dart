import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/providers/dict_view_provider/dict_view_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/pop_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/reset_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_text_widget/dict_text_widget.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_text_widget/input_text_field.dart';
import 'package:dict_app/widgets/player_widget/player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictView extends ConsumerWidget {
  const DictView(this.dict, {super.key});

  final Dict dict;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
        resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          trailing: const ResetButton(),
          leading: const PopButton(),
          middle: Text(dict.value.title),
        ),
        child: Center(child: 
        SafeArea(
            child: Stack(
          children: [
            Column(
              children: [
                Expanded(child: DictTextWidget(dict.id)),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      color: CupertinoColors.white,
                      child: PlayerWidget(),
                    ),
                  ),
                ],
            ),
            InputTextField(),
          ],
        )),));
  }
}
