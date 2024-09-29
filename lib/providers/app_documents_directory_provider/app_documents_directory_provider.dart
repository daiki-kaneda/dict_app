import 'package:dict_app/providers/app_documents_directory_provider/app_documents_directory_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_documents_directory_provider.g.dart';

@riverpod
class AppDocumentsDirectoryNotifier extends _$AppDocumentsDirectoryNotifier {
  @override
  FutureOr<AppDocumentsHelper> build() async {
    final appDocumentHelper = AppDocumentsHelper();
    await appDocumentHelper.init();
    return appDocumentHelper;
  }

  Future<String> fullPath(String filePath)async{
    final previousState = await future;
    return previousState.fullPath(filePath);
  }

  Future<void> delete(String filePath)async{
    final previousState = await future;
    previousState.deleteFile(filePath);
  }
}
