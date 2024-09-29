import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_key_provider.g.dart';

@riverpod
FutureOr<String> apiKey (ApiKeyRef ref) async{
  await dotenv.load(fileName: '.env');
  return dotenv.get('API_KEY');
}