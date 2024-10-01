import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/pop_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictView extends ConsumerWidget {
  const DictView(this.dict, {super.key});

  final Dict dict;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: const PopButton(),
          middle: Text(dict.value.title),
        ),
        child: Center(
          child:SingleChildScrollView(
            child:  Text(dict.value.toJson().toString()),
          )
        ));
  }
}
