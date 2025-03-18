import 'package:dict_app/isar_widgets/file_details_view/listening_view/listening_page_view/listening_page.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListeningPageView extends ConsumerWidget {
  const ListeningPageView({
    super.key,
    required this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(currentSentenceIndexInAllSentencesProvider(id));
    final file = ref.watch(fileNotifierProvider(id));
    final controller = ref.watch(sentencePageControllerProvider(id));
    final sentences = file?.getAllSentences;
    // when sentence index changed
    ref.listen(currentSentenceIndexInAllSentencesProvider(id), (_, i) {
      final s = file?.getAllSentences?[i];
      // update range of audio to play
      ref
          .read(startEndProviderProvider.notifier)
          .setNewValue(s?.start ?? 0, s?.end ?? 0);
      print((s?.start, s?.end).toString());
    });
    if (sentences == null) return Container();

    return PlatformScrollbar(
        scrollbarOrientation: ScrollbarOrientation.bottom,
        controller: controller,
        child: PageView.builder(
          controller: controller,
          itemCount: sentences.length,
          itemBuilder: (context, index) {
            final dictationSentence = sentences[index];
            return ListeningPage(id, dictationSentence: dictationSentence);
          },
        ));
  }
}