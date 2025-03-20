import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:dict_app/providers/mlkit_translation_helper_provider/mlkit_translation_helper_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TranslatedText extends ConsumerWidget {
  const TranslatedText(this.source, {super.key});

  final String source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translator = ref.read(mlkitTranslationHelperProvider).requireValue;
    return FutureBuilder(
      future: translator.translate(source),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!,
            style: TextStyle(fontWeight: FontWeight.w600),
          );
        } else {
          return Center(
            child: PlatformCircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class LlmTranslatedText extends ConsumerWidget {
  const LlmTranslatedText(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentSentenceIndex =
        ref.watch(currentSentenceIndexInAllSentencesProvider(fileId));
    final translatedSentences = ref.watch(translatedSentencesProvider(fileId));
    final sentence = translatedSentences.elementAtOrNull(currentSentenceIndex);

    if (sentence != null) {
      return Text(
        sentence,
        style: TextStyle(fontWeight: FontWeight.w600),
      );
    } else {
      return Center(
        child: PlatformCircularProgressIndicator(),
      );
    }
  }
}

class ShowTranslationWrapper extends ConsumerWidget {
  const ShowTranslationWrapper({super.key, required this.builder});
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showTranslation = ref
        .watch(settingNotifierProvider.selectAsync((s) => s.showTranslation));

    return FutureBuilder(
      future: showTranslation,
      builder: (context, snapshot) {
        if (snapshot.data == true) {
          return builder(context);
        } else {
          return Container();
        }
      },
    );
  }
}
