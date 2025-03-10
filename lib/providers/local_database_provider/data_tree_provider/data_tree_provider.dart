import 'dart:convert';

import 'package:dict_app/constants/inner_navigator_key.dart';
import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/models/data_tree/dict_data/dict_data.dart';
import 'package:dict_app/models/data_tree/dict_data/transcript_model.dart';
import 'package:dict_app/models/data_tree/folder_metadata.dart';
import 'package:dict_app/providers/api_helper_provider/api_helper_provider.dart';
import 'package:dict_app/providers/app_directory_provider/app_documents_directory_provider.dart';
import 'package:dict_app/providers/app_directory_provider/app_support_directory_provider.dart';
import 'package:dict_app/providers/file_picker_provider/file_picker_provider.dart';
import 'package:dict_app/providers/local_database_provider/local_data_status.dart';
import 'package:dict_app/providers/local_database_provider/local_database_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/utils/dialog.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tree_data_model/tree_data_model.dart';

part 'data_tree_provider.g.dart';

@riverpod
class DataTreeNotifier extends _$DataTreeNotifier {
  @override
  FutureOr<Folder> build() async {
    // when update,always save
    ref.listenSelf((_, __) {
      saveData();
    });

    final localData = await ref.read(localDatabaseProvider.future);
    final savedString = localData.loadData(LocalDataStatus.dataTree);
    if (savedString != null) {
      try {
        final savedData = Folder.fromJson(
            jsonDecode(savedString) as Map<String, dynamic>,
            (t) => DictData.fromJson(t as Map<String, dynamic>),
            (u) => FolderMetadata.fromJson(u as Map<String, dynamic>));
        return savedData;
      } catch (e) {
        print(e.toString());
      }
    }
    return Node<DictData, FolderMetadata>(
        value: FolderMetadata(title: 'Root', createdAt: DateTime.now()),
        subTrees: []);
  }

  Future<void> saveData() async {
    final localData = await ref.read(localDatabaseProvider.future);
    final previousState = await future;
    localData.saveData(LocalDataStatus.dataTree,
        jsonEncode(previousState.toJson((t) => t.toJson(), (u) => u.toJson())));
  }

  // CRUD operations for Dict,Folder
  Future<void> createDict(String nodeId, Dict newDict) async {
    final previousFolder = await future;
    state = AsyncData(previousFolder.createLeaf(nodeId: nodeId, leaf: newDict));
  }

  Future<void> updateDict(String leafId, Dict newDict) async {
    final previousFolder = await future;
    state = AsyncData(previousFolder.updateLeaf(leafId: leafId, leaf: newDict));
  }

  Future<void> deleteDict(String leafId) async {
    final previousFolder = await future;
    state = AsyncData(previousFolder.deleteLeafById(leafId: leafId));
    // delete audio data
    ref
        .read(appSupportDirectoryNotifierProvider.notifier)
        .deleteAllWasteFile();
  }

  Future<void> createFolder(String nodeId, Folder newFolder) async {
    final previousFolder = await future;
    state =
        AsyncData(previousFolder.createNode(nodeId: nodeId, node: newFolder));
  }

  Future<void> updateFolder(String nodeId, Folder newFolder) async {
    final previousFolder = await future;
    state =
        AsyncData(previousFolder.updateNode(nodeId: nodeId, node: newFolder));
  }

  Future<void> deleteFolder(String nodeId) async {
    final previousFolder = await future;
    // avoid delete route
    if (previousFolder.id == nodeId) {
      return;
    }
    state = AsyncData(previousFolder.deleteNodeById(nodeId: nodeId)!);
    // delete audio data
    ref
        .read(appSupportDirectoryNotifierProvider.notifier)
        .deleteAllWasteFile();
  }

  Future<void> deleteAll() async {
    final ids = ref.read(selectedIdsProvider);
    for (final id in ids) {
      await deleteDict(id);
    }
  }

  Future<void> changeFolderName(
    String nodeId,
    String newName,
  ) async {
    final root = await future;
    final node = root.readNodeById(nodeId: nodeId);
    if (node == null) return;

    state = AsyncData(root.updateNode(
        nodeId: nodeId,
        node: node.copyWith(value: node.value.copyWith(title: newName))));
  }

  Future<void> changeDictName(
    String dictId,
    String newName,
  ) async {
    final root = await future;
    final dict = root.readLeafById(id: dictId);
    if (dict == null) return;

    state = AsyncData(root.updateLeaf(
        leafId: dictId,
        leaf: dict.copyWith(value: dict.value.copyWith(title: newName))));
  }

  Future<void> moveFolder(String folderId, String newParentId) async {
    final root = await future;
    final folder = root.readNodeById(nodeId: folderId);
    final parent = root.readNodeById(nodeId: newParentId);
    if (folder == null || parent == null) return;
    var result = root;
    result = result.deleteNodeById(nodeId: folderId) ?? result;
    result = result.createNode(nodeId: newParentId, node: folder);
    state = AsyncData(result);
  }

  Future<void> moveDict(String dictId, String newParentId) async {
    final root = await future;
    final dict = root.readLeafById(id: dictId);
    final parent = root.readNodeById(nodeId: newParentId);
    if (dict == null || parent == null) return;
    var result = root;
    result = result.deleteLeafById(leafId: dictId);
    result = result.createLeaf(nodeId: newParentId, leaf: dict);
    state = AsyncData(result);
  }

  // for json serializable test
  Future<void> test() async {
    final previousState = await future;
    state = AsyncData(previousState.updateNode(
        nodeId: previousState.id,
        node: Node(
            value: FolderMetadata(title: 'root', createdAt: DateTime.now()),
            subTrees: [
              Node(
                  value: FolderMetadata(
                      title: 'newFolder', createdAt: DateTime.now()),
                  subTrees: [])
            ])));
    saveData();
  }

  /// This function is for add new dictation data from local file user picked
  Future<void> addNewDict({
    required String nodeId,
    String? title,
  }) async {
    try {
      print(await ref
          .read(appSupportDirectoryNotifierProvider.notifier)
          .fileNames());
      final result =
          await ref.read(filerPickerNotifierProvider.notifier).getAudioData();
      if (result != null) {
        print('got result!');
        final (path, bytes, size) = result;
        if (!validateAudioSize(size, maxSizeMbs)) {
          DialogStatus.exceedMaxAudioLengthError.showCustomDialog(innerNavigatorKey.currentContext!);
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
        final dictData = DictData.from(
            title: title ?? '新規ディクテーション', transcript, audioPath: filePath);
        createDict(nodeId, Leaf(value: dictData));
      }
    } catch (e) {
                DialogStatus.unExpectedError.showCustomDialog(innerNavigatorKey.currentContext!);
      print(e.toString());
      ref
          .read(appSupportDirectoryNotifierProvider.notifier)
          .deleteAllWasteFile();
    }
  }

  Future<void> tryCharacter(
      {required String input,
      required String dictId,
      required int paragraphIndex,
      required int sentenceIndex,
      required int wordIndex,
      bool solveAnyway = false}) async {
    final previousDict = (await future).readLeafById(id: dictId);
    if (previousDict == null) return;
    final updatedDict = previousDict.copyWith(
        value: previousDict.value.copyWith(
            paragraphs: previousDict.value.paragraphs.tryCharacter(
                input: input,
                paragraphIndex: paragraphIndex,
                sentenceIndex: sentenceIndex,
                wordIndex: wordIndex,
                solveAnyway: solveAnyway)));
    updateDict(dictId, updatedDict);
  }

  // TODO:implement reset problem data logic per paragraphs,paragraph,sentence,word
  Future<void> resetParagraphs({required String dictId}) async {
    final previousDict = (await future).readLeafById(id: dictId);
    if (previousDict == null) return;

    final updatedDict = previousDict.copyWith(
        value: previousDict.value
            .copyWith(paragraphs: previousDict.value.paragraphs.reset()));
    updateDict(dictId, updatedDict);
  }

  Future<void> resetParagraph(
      {required String dictId, required int paragraphIndex}) async {
    final previousDict = (await future).readLeafById(id: dictId);
    if (previousDict == null) return;

    final updatedDict = previousDict.copyWith(
        value: previousDict.value.copyWith(
            paragraphs: previousDict.value.paragraphs
                .resetParagraph(paragraphIndex: paragraphIndex)));
    updateDict(dictId, updatedDict);
  }

  Future<void> resetSentence(
      {required String dictId,
      required int paragraphIndex,
      required int sentenceIndex}) async {
    final previousDict = (await future).readLeafById(id: dictId);
    if (previousDict == null) return;

    final updatedDict = previousDict.copyWith(
        value: previousDict.value.copyWith(
            paragraphs: previousDict.value.paragraphs.resetSentence(
                paragraphIndex: paragraphIndex, sentenceIndex: sentenceIndex)));
    updateDict(dictId, updatedDict);
  }

  Future<void> shareJsonString(
      {required String treeId, bool isDict = false, bool isRaw = false}) async {
    final root = await future;
    if (isRaw) {
      TranscriptModel? target =
          root.readLeafById(id: treeId)?.value.transcriptModel;
      if (target == null) return;
      Share.share(jsonEncode(target.toJson()));
    }
    DataTree? target;
    if (isDict) {
      target = root.readLeafById(id: treeId);
    } else {
      target = root.readNodeById(nodeId: treeId);
    }
    if (target == null) return;
    Share.share(
        jsonEncode(target.toJson((t) => t.toJson(), (u) => u.toJson())));
  }
}
