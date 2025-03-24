import 'package:collection/collection.dart';
import 'package:dict_app/my_dict/constants/inner_navigator_key.dart';
import 'package:dict_app/my_dict/widgets/app.dart';
import 'package:dict_app/my_dict/models/data_tree_isar/item.dart';
import 'package:dict_app/my_dict/providers/api_helper_provider/api_helper_provider.dart';
import 'package:dict_app/my_dict/providers/app_directory_provider/app_support_directory_provider.dart';
import 'package:dict_app/my_dict/providers/file_picker_provider/file_picker_provider.dart';
import 'package:dict_app/my_dict/providers/isar_database_provider/isar_provider.dart';
import 'package:dict_app/my_dict/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:dict_app/my_dict/utils/dialog.dart';
import 'package:dict_app/my_dict/utils/utils.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sub_items_provider.g.dart';

@riverpod
class SubItemsProvider extends _$SubItemsProvider {
  @override
  Future<List<Item>> build(int? parentId) async {
    final List<Folder> subFolders = await getSubFolders(parentId);
    final List<File> subFiles = await getSubFiles(parentId);
    final sortedSubFiles = [
      ...subFiles.where((f)=>!f.paragraphs.isCompleted)
      .sorted((x,y)=>y.lastUpdatedAt.compareTo(x.lastUpdatedAt)),
      ...subFiles.where((f)=>f.paragraphs.isCompleted)
      .sorted((x,y)=>y.lastUpdatedAt.compareTo(x.lastUpdatedAt))];

    return [...subFolders, ...sortedSubFiles];
  }

  Isar get isar => ref.read(isarProvider).requireValue;
  DateTime now() => DateTime.now();

  // Utility
  Future<List<Folder>> getSubFolders(int? parentId) async {
    return isar.folders.filter().parentIdEqualTo(parentId).findAll();
  }

  Future<List<File>> getSubFiles(int? parentId) async {
    return isar.files.filter().parentIdEqualTo(parentId).findAll();
  }

  // CRUD Folder
  Future<void> createFolder({required String title}) async {
    final current = now();
    final newFolder =
        Folder(parentId: parentId, title: title, createdAt: current,lastUpdatedAt: current);
    await isar.writeTxn(() async {
      await isar.folders.put(newFolder);
    });
    ref.invalidateSelf();
  }

  Future<void> updateFolder(int id, {String? newTitle}) async {
    final folder = await isar.folders.get(id);
    if (folder != null) {
      await isar.writeTxn(() async {
        await isar.folders.put(folder.copyWith(
          title: newTitle,
          lastUpdatedAt: now()));
      });
    }
    ref.invalidateSelf();
  }

  Future<void> deleteFolder(int id) async {
    await isar.writeTxn(() async {
      await isar.folders.delete(id);

      // delete all sub items
      await isar.files.deleteAll(
        (await getSubFiles(id)).map((file) => file.id).whereType<int>().toList(),
      );
      await isar.folders.deleteAll(
        (await getSubFolders(id)).map((folder) => folder.id).whereType<int>().toList(),
      );
    });
    ref.invalidateSelf();
  }

  // CRUD File

  Future<void> createFileFromLocalAudio({
    String? title,
  }) async {
    try {
      final result =
          await ref.read(filerPickerNotifierProvider.notifier).getAudioData();
      if (result != null) {
        print('got result!');
        final (path, bytes, size) = result;
        final isValidate = await validateAudioLength(path);
        if (!isValidate) {
          DialogStatus.exceedMaxAudioLengthError.showCustomDialog(navigatorKey.currentContext!);
          return;
        }
        final ext = path.split('.').lastOrNull;
        print('got path:$path');
        if (ext == null) throw Exception('could not get file extension!');
        final filePath = await ref
            .read(appSupportDirectoryNotifierProvider.notifier)
            .saveFile(ext: ext, bytes: bytes);
        print('savedTo:$filePath ');
        final transcript = await ref
            .read(apiHelperNotiferProvider.notifier)
            .stt(ext: ext, bytes: bytes);
        if (transcript == null) return;
        print(
            'got transcription:${transcript.results?.channels?.firstOrNull?.alternatives?.firstOrNull?.transcript}');
        final newFile = File.from(
            parentId: parentId,
            title: title ?? '新規ディクテーション',
            transcript,
            audioPath: filePath);

        await isar.writeTxn(() async {
          isar.files.put(newFile);
        });
        ref.invalidateSelf();
        // consume 1 ticket
        ref.read(settingNotifierProvider.notifier).consumeTickets();
      }
    } catch (e) {
      DialogStatus.unExpectedError.showCustomDialog(innerNavigatorKey.currentContext!);
      print(e.toString());
    }
  }

  // Future<void> createFile({required String fileName}) async {
  //   final newFile = File(
  //     parentId: parentId,
  //     title: fileName,
  //     createdAt: DateTime.now(),
  //     audioPath: audioPath, description: description, isFavorite: isFavorite, duration: duration, transcript: transcript, paragraphs: paragraphs)
  //   File()
  //     ..parentId = parentId
  //     ..fileName = fileName;
  //   await isar.writeTxn(() async {
  //     await isar.files.put(newFile);
  //   });
  //   ref.invalidateSelf();
  // }

  Future<void> updateFile(int id,{String? title}) async {
    final file = await isar.files.get(id);
    if (file != null) {
      await isar.writeTxn(() async {
        await isar.files.put(file.copyWith(title: title,
        lastUpdatedAt: now()));
      });
    }
    ref.invalidateSelf();
  }

  Future<void> deleteFile(int id) async {
    await isar.writeTxn(() async {
      await isar.files.delete(id);
    });
    ref.invalidateSelf();
  }

  // Move file
  Future<void> moveFile(int id, int? newParentId) async {
    final file = await isar.files.get(id);
    if (file != null) {
      await isar.writeTxn(() async {
        await isar.files.put(file.copyWith(
          parentId: newParentId,
          lastUpdatedAt: now()
        ));
      });
    }
    ref.invalidateSelf();
  }

  // Move folder
  Future<void> moveFolder(int id, int? newParentId) async {
    final folder = await isar.folders.get(id);
    if (folder != null) {
      await isar.writeTxn(() async {
        await isar.folders.put(folder.copyWith(
          parentId: newParentId,
          lastUpdatedAt: now()
        ));
      });
    }
    ref.invalidateSelf();
  }
}
