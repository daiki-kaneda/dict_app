import 'package:dict_app/providers/mlkit_translation_helper_provider/mlkit_translation_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mlkit_translation_helper_provider.g.dart';

@riverpod
Future<MlkitEnglishTranslationHelper> mlkitTranslationHelper(
    MlkitTranslationHelperRef ref) async {
  final helper = MlkitEnglishTranslationHelper('ja');
  ref.onDispose(() {
    helper.deleteModel();
  });
  await helper.init();
  return helper;
}
