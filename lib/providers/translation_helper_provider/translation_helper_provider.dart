import 'package:dict_app/providers/translation_helper_provider/translation_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'translation_helper_provider.g.dart';

@riverpod
Future<EnglishTranslationHelper> translationHelper(
    TranslationHelperRef ref) async {
  final helper = EnglishTranslationHelper('ja');
  ref.onDispose(() {
    helper.deleteModel();
  });
  await helper.init();
  return helper;
}
