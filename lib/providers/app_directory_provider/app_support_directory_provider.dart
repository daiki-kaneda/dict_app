import 'dart:typed_data';

import 'package:dict_app/providers/app_directory_provider/app_support_directory_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'app_support_directory_provider.g.dart';

@Riverpod(keepAlive: true)
class AppSupportDirectoryNotifier extends _$AppSupportDirectoryNotifier {
  @override
  FutureOr<AppSupportHelper> build() async {
    final appSupportHelper = AppSupportHelper();
    await appSupportHelper.init();
    return appSupportHelper;
  }

  Future<String> saveFile(
      {required String ext, required Uint8List bytes}) async {
    final previousState = await future;
    final randomName = Uuid().v4();
    final randomPath = '$randomName.$ext';
    previousState.saveFile(randomPath, bytes);
    return randomPath;
  }

  Future<String> fullPath(String filePath) async {
    final previousState = await future;
    return previousState.fullPath(filePath);
  }

  Future<void> delete(String filePath) async {
    final previousState = await future;
    previousState.deleteFile(filePath);
  }

  Future<List<String>?> fileNames() async {
    final previousState = await future;
    return await previousState.fileNames();
  }
}
