import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/buttons/reset_button.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_sentence_problem.dart';
import 'package:dict_app/widgets/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictSentenceListview extends ConsumerWidget {
  const DictSentenceListview(this.dictId,this.paragraphIndex,this.focusNode,{super.key});

  final String dictId;
  final int paragraphIndex;

  final FocusNode focusNode;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
      final paragraph = ref.watch(dataTreeNotifierProvider.select(
      (dataTreeAsync){
        if(dataTreeAsync.hasValue)return dataTreeAsync.value!.readLeafById(id: dictId)?.value.paragraphs.paragraphs.elementAtOrNull(paragraphIndex);
        return null;
      }
    ));
    if(paragraph==null) return Center(child: PlatformCircularProgressIndicator());
    return ListView(
      children: paragraph.sentences.asMap().entries.map(
        (e)=>PlatformListTile(
          leading: CompletenessIcon(paragraph.sentences[e.key].isCompleted),
          title: Text(e.key.toString()),
          onTap: () {
            ref.read(sentenceIndexNotifierProvider.notifier).updateIndex(e.key);
            ref.read(wordIndexNotifierProvider.notifier).updateIndex(-1);
            ref.read(audioPlayerNotifierProvider.notifier)
            .setPlayBackrate(SpeedStatus.normal);
            ref.read(startEndProviderProvider.notifier)
            .setNewValue(e.value.start, e.value.end);

            Navigator.of(context).push(CupertinoPageRoute(builder:(context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
                  //leading: DictPopButton(),
                  middle: Text('sentence-${e.key}'),
                  trailing: const ResetButton(ResetStatus.sentence),
                ),
                child: SafeArea(child: 
                DictSentenceProblemView(focusNode)));
            },));
          },
        )
      ).toList(),
    );
  }
}