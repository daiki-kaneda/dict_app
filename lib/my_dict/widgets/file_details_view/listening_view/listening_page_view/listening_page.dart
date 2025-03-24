import 'package:dict_app/my_dict/widgets/file_details_view/translated_text.dart';
import 'package:dict_app/my_dict/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/my_dict/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListeningPage extends ConsumerWidget {
  const ListeningPage(this.fileId,
      {super.key, required this.dictationSentence});

  final int fileId;
  final DictationSentence dictationSentence;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingNotifierProvider);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SelectableText(
                dictationSentence.displayText,
                style: TextStyle(
                    fontSize: setting.value?.textSize.toDouble() ?? 20,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              ShowTranslationWrapper(builder: (_) => LlmTranslatedText(fileId))
            ],
          ),
        ));
  }
}
