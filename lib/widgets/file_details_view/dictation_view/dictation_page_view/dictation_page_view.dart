import 'package:dict_app/widgets/file_details_view/dictation_view/dictation_page_view/dictation_page/dictation_page.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictationPageView extends ConsumerStatefulWidget {
  const DictationPageView({
    super.key,
    required this.id,
  });
  final int id;

  @override
  ConsumerState<DictationPageView> createState() => _DictationPageViewState();
}

class _DictationPageViewState extends ConsumerState<DictationPageView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(currentWordIndexProvider(widget.id).notifier)
          .moveToFirstUnsolvedIndex();
      ref
          .read(sentencePageControllerProvider(widget.id).notifier)
          .moveToFirstUnsolvedIndex();
      ref.read(inputTextFieldFocusNodeProvider.notifier).requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(currentSentenceIndexInAllSentencesProvider(widget.id));
    ref.watch(currentWordIndexProvider(widget.id));
    ref.watch(showErrorEffectProvider(widget.id));
    final file = ref.watch(fileNotifierProvider(widget.id));
    final controller = ref.watch(sentencePageControllerProvider(widget.id));
    final sentences = file?.getAllSentences;
    // when sentence index changed
    ref.listen(currentSentenceIndexInAllSentencesProvider(widget.id), (_, i) {
      final s = file?.getAllSentences[i];
      // update range of audio to play
      ref
          .read(startEndProviderProvider.notifier)
          .setNewValue(s?.start ?? 0, s?.end ?? 0);
      print((s?.start, s?.end).toString());
      // update wordIndex to newest unSolvedIndex
      ref
          .read(currentWordIndexProvider(widget.id).notifier)
          .moveToFirstUnsolvedIndex();
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
            return DictationPage(widget.id,
                dictationSentence: dictationSentence);
          },
        ));
  }
}
