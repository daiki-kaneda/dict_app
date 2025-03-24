import 'package:dict_app/my_dict/widgets/file_details_view/dictation_view/dictation_page_view/dictation_page/dict_sentence_widget/dict_word_widget.dart';
import 'package:dict_app/my_dict/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class DictSentenceWidget extends StatelessWidget {
  const DictSentenceWidget(this.fileId, {super.key, required this.sentence});

  final int fileId;
  final DictationSentence sentence;

  @override
  Widget build(BuildContext context) {
    if (sentence.words == null) {
      return Center(
        child: PlatformCircularProgressIndicator(),
      );
    }
    return Wrap(
            spacing: 10,
            children: sentence.words!
                .asMap()
                .entries
                .map((e) => DictWordWidget(
                      fileId,
                      index: e.key,
                      word: e.value,
                    ))
                .toList());
  }
}
