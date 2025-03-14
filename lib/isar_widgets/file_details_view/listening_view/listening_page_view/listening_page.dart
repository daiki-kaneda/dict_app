import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListeningPage extends ConsumerWidget {
  const ListeningPage(this.fileId,{super.key,required this.sentence});

  final int fileId;
  final DictationSentence sentence;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}