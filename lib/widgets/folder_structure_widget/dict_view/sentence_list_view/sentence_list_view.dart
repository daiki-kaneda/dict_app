import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_text_widget/input_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SentenceListView extends ConsumerWidget {
  const SentenceListView(this.dictId, {super.key});

  final String dictId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final problems = ref.watch(dataTreeNotifierProvider.select(
        (d) => d.value?.readLeafById(id: dictId)?.value.problems ?? []));
    return Stack(
      children: [
        ListView(
            children: problems
                .map((p) => ListTile(
                      title: Text(p.sentence),
                      trailing: Icon(
                        p.isCompleted
                            ? CupertinoIcons.check_mark_circled_solid
                            : CupertinoIcons.circle,
                        color: p.isCompleted
                            ? CupertinoColors.activeGreen
                            : CupertinoColors.inactiveGray,
                      ),
                    ))
                .toList()),
        InputTextField()
      ],
    );
  }
}
