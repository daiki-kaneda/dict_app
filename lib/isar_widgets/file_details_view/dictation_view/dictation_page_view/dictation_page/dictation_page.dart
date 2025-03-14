import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/dictation_page/dict_sentence_widget/dict_sentence_widget.dart';
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/translation_helper_provider/translation_helper_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictationPage extends ConsumerWidget {
  const DictationPage(this.fileId, {super.key,required this.dictationSentence});

  final int fileId;
  final DictationSentence dictationSentence;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // return Center(
    //   child: Text(dictationSentence.toJson().toString()),
    // );
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DictSentenceWidget(
          fileId,
          sentence: dictationSentence,
        ),
        TranslatedText(dictationSentence.displayText),
      ],
    );
  }
}

class TranslatedText extends ConsumerWidget {
  const TranslatedText(this.source, {super.key});

  final String source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translator = ref.read(translationHelperProvider).requireValue;
    return FutureBuilder(
      future: translator.translate(source),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!);
        } else {
          return Center(
            child: PlatformCircularProgressIndicator(),
          );
        }
      },
    );
  }
}
