import 'package:dict_app/providers/api_helper_provider/api_helper/api_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_helper_provider.g.dart';
@riverpod
FutureOr<ApiRepository> apiHelper(ApiHelperRef ref) async{
  return ApiRepository('');
}