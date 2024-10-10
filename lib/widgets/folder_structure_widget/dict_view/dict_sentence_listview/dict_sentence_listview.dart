import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_paragraph_widget/dict_paragraph_widget.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_sentence_problem.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_sentence_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictSentenceListview extends ConsumerWidget {
  const DictSentenceListview(this.paragraph,this.focusNode,{super.key});

  final DictationParagraph paragraph;

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: paragraph.sentences.asMap().entries.map(
        (e)=>ListTile(
          title: Text(e.key.toString()),
          onTap: () {
            ref.read(sentenceIndexNotifierProvider.notifier).updateIndex(e.key);
            ref.read(audioPlayerNotifierProvider.notifier)
            .setPlayBackrate(SpeedStatus.normal);
            ref.read(startEndProviderProvider.notifier)
            .setNewValue(e.value.start, e.value.end);

            Navigator.of(context).push(CupertinoPageRoute(builder:(context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(),
                child: SafeArea(child: 
                DictSentenceProblemView(e.value, focusNode)));
            },));
          },
        )
      ).toList(),
    );
  }
}