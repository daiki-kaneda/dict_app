import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class MlkitEnglishTranslationHelper {
  MlkitEnglishTranslationHelper(this.targetLanguageCode);

  final String targetLanguageCode;
  late final TranslateLanguage targetLanguage;
  late final OnDeviceTranslator translator;

  final _modelManager = OnDeviceTranslatorModelManager();

  Future<void> init() async {
    targetLanguage = fromRawValue(targetLanguageCode) ?? TranslateLanguage.japanese;
    translator = OnDeviceTranslator(
        sourceLanguage: TranslateLanguage.english,
        targetLanguage: targetLanguage);
    await _downloadModel();
  }

  void close() {
    translator.close();
    
  }

  Future<String> translate(String input) async {
    try{
    if(!(await _checkIfDownloaded())) throw Exception('Model not downloaded');
    final result = await translator.translateText(input);
    return result;
    }catch(e){
      print('error occured');
    return '';
    }
  }

  Future<void> _downloadModel() async {
    _modelManager.downloadModel(TranslateLanguage.english.bcpCode);
    _modelManager.downloadModel(targetLanguage.bcpCode);
  }

  Future<bool> _checkIfDownloaded() async {
    try {
      final result = (await _modelManager
              .isModelDownloaded(TranslateLanguage.english.bcpCode)) &&
          (await _modelManager.isModelDownloaded(targetLanguage.bcpCode));
      return result;
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteModel() async {
    _modelManager.deleteModel(TranslateLanguage.english.bcpCode);
    _modelManager.deleteModel(targetLanguage.bcpCode);
  }

TranslateLanguage? fromRawValue(String bcpCode) {
    try {
      return TranslateLanguage.values
          .firstWhere((element) => element.bcpCode == bcpCode);
    } catch (_) {
      return null;
    }
  }
} 



