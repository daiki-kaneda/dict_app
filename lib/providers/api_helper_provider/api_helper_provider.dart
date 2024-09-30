import 'dart:typed_data';

import 'package:dict_app/models/data_tree/dict_data/transcript_model.dart';
import 'package:dict_app/providers/api_helper_provider/api_helper/api_helper.dart';
import 'package:dict_app/providers/api_helper_provider/api_key_provider/api_key_provider.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_helper_provider.g.dart';
@riverpod
class ApiHelperNotifer extends _$ApiHelperNotifer {
  @override
  FutureOr<ApiRepository> build() async{
    final apiKey = await ref.read(apiKeyProvider.future);
    return ApiRepository(apiKey);
  }

  Future<TranscriptModel?> stt({
    required String ext,
    required Uint8List bytes,
  })async{
    final helper = await future;
    final transcriptModel = await helper.speechToTextRequest(
      bytes, ext: ext, cancelToken: CancelToken());
    
    return transcriptModel;
  }
}