import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/dictation_page/dict_sentence_widget/dict_sentence_widget.dart';
import 'package:dict_app/isar_widgets/file_details_view/translated_text.dart';
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictationPage extends ConsumerWidget {
  const DictationPage(this.fileId,
      {super.key, required this.dictationSentence});

  final int fileId;
  final DictationSentence dictationSentence;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DictSentenceWidget(
              fileId,
              sentence: dictationSentence,
            ),
            SizedBox(height: 20,),
            LlmTranslatedText(fileId)
          ],
        ),
        ));
  }
}
