import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';

class ApiRepository {
  final String apiKey;

  static const String projectId = '5df6ae98-2fff-4c36-a85e-7dac4334afa5';

  ApiRepository(this.apiKey);

  final _dio = Dio();

  // Future<Response<List<int>>> textToSpeechRequest(
  //   AudioRequestData requestData,
  //   {required CancelToken cancelToken}) async {
  //   const url = 'https://api.deepgram.com/v1/speak';

  //   final queryParameters = {
  //     'model': requestData.model.value,
  //     'encoding': requestData.encoding.name,
  //   };

  //   final data = jsonEncode({'text': requestData.text});

  //   try {
  //     final response = await _dio.post<List<int>>(
  //       url,
  //       queryParameters: queryParameters,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'accept': 'text/plain',
  //           'Authorization': 'Token $apiKey',
  //         },
  //         responseType: ResponseType.bytes,
  //       ),
  //       cancelToken: cancelToken,
  //       data: data,
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<Response<String>> speechToTextRequest(
  //   Uint8List audioBytes,
  //   {required CancelToken cancelToken}) async {
  //   const  url = 'https://api.deepgram.com/v1/listen';

  //   final queryParameters = {
  //     'model': 'nova-2',
  //     'language': 'en',
  //     'paragraphs': 'true',
  //     'punctuate': 'true',
  //     'smart_format': 'true',
  //   };

  //   try {
  //     final response = await _dio.post<String>(
  //       url,
  //       queryParameters: queryParameters,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'audio/mp3',
  //           'Authorization': 'Token $apiKey',
  //         },
  //         responseType: ResponseType.json
  //       ),
  //       cancelToken: cancelToken,
  //       data: audioBytes,
  //     );
  //     return response;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  
  Future<Response<String>> balanceRequest() async {
    const url = 'https://api.deepgram.com/v1/projects/$projectId/balances';

    try {
      final response = await _dio.get<String>(
        url,
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Token $apiKey',
          },
          responseType: ResponseType.plain
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}