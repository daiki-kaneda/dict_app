import 'package:dict_app/isar_widgets/file_details_view/dictation_page_view/dictation_page/dictation_page.dart';
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
    ref.watch(currentSentenceIndexInAllSentencesProvider);
    ref.watch(currentWordIndexProvider);
    final file = ref.watch(fileNotifierProvider(id));
    final controller = ref.watch(sentencePageControllerProvider);
    final sentences = file?.getAllSentences;
    // when sentence index changed
    ref.listen(currentSentenceIndexInAllSentencesProvider, (_, i) {
      final s = file?.getAllSentences?[i];
      // update range of audio to play
      ref
          .read(startEndProviderProvider.notifier)
          .setNewValue(s?.start ?? 0, s?.end ?? 0);
      print((s?.start,s?.end).toString());
      // update wordIndex to newest unSolvedIndex
      ref.read(currentWordIndexProvider.notifier)
      .updateIndex(s?.newestUnsolvedIndex() ?? 0);
      print('newestUnsolvedWordIndex: ${s?.newestUnsolvedIndex()}');
    });
    if (sentences == null) return Container();

    return PageView.builder(
      controller: controller,
      itemCount: sentences.length,
      itemBuilder: (context, index) {
        final dictationSentence = sentences[index];
        return DictationPage(
          dictationSentence);
      },
    );
  }
}
