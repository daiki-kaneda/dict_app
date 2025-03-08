import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictationPageView extends ConsumerWidget {
  const DictationPageView({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(currentSentenceIndexProvider);
    final controller = ref.watch(sentencePageControllerProvider);
    final sentences = ref.watch(fileProvider(id))?.getAllSentences;
    if (sentences == null) return Container();

    return PageView.builder(
      controller: controller,
      itemCount: sentences.length,
      itemBuilder: (context, index) {
        final dictationSentence = sentences[index];
        return Center(child:Text( dictationSentence.displayText));
      },
    );
  }
}
