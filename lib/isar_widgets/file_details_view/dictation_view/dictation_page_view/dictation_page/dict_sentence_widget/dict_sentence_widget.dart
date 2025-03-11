import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/dictation_page/dict_sentence_widget/dict_word_widget.dart';
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictSentenceWidget extends StatelessWidget {
  const DictSentenceWidget({super.key, required this.sentence});

  final DictationSentence sentence;

  @override
  Widget build(BuildContext context) {
    if (sentence.words == null) {
      return Center(
        child: PlatformCircularProgressIndicator(),
      );
    }
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Wrap(
            spacing: 10,
            children: sentence.words!
                .asMap()
                .entries
                .map((e) => DictWordWidget(
                      index: e.key,
                      word: e.value,
                    ))
                .toList()));
  }
}
