import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/pop_button.dart';
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
          leading: const PopButton(),
          middle: Text(dict.value.title),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20.0),
                SingleChildScrollView(
                  child: Text(dict.toJson((t)=>t.toJson(), (u)=>u.toJson()).toString()),
                ),
                Center(
                  child: Text('audio player'),
                ),
              ],
            ),
          ),
        ));
  }
}
