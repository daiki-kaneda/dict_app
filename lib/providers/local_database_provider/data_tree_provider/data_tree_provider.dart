import 'dart:convert';
import 'dart:developer';

import 'package:dict_app/models/data_tree/data_tree.dart';
import 'package:dict_app/models/data_tree/dict_data/dict_data.dart';
import 'package:dict_app/models/data_tree/folder_metadata.dart';
import 'package:dict_app/providers/local_database_provider/local_data_status.dart';
import 'package:dict_app/providers/local_database_provider/local_database_helper.dart';
import 'package:dict_app/providers/local_database_provider/local_database_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tree_data_model/tree_data_model.dart';
import 'package:dict_app/extension/extension.dart';

part 'data_tree_provider.g.dart';

@riverpod
class DataTreeNotifier extends _$DataTreeNotifier {
  @override
  FutureOr<Folder> build() async{
    // when update,always save
    ref.listenSelf((_,__){
      saveData();
    });

    final localData = await ref.read(localDatabaseProvider.future);
    final savedString = localData.loadData(LocalDataStatus.dataTree);
    if(savedString!=null){
      try{
      final savedData = Folder.fromJson(
        jsonDecode(savedString) as Map<String, dynamic>,
        (t)=>DictData.fromJson(t as Map<String,dynamic>),
        (u)=>FolderMetadata.fromJson(u as Map<String,dynamic>)
      );
      return savedData;
      }catch(e){
        log(e.toString());
      }
    }
    return Node<DictData,FolderMetadata>(
      value: FolderMetadata(
        title: 'Root', 
        createdAt: DateTime.now()), 
        subTrees: []);
  }

  Future<void> saveData()async{
    final localData = await ref.read(localDatabaseProvider.future);
    final previousState = await future;
    localData.saveData(
      LocalDataStatus.dataTree,
      jsonEncode(previousState.toJson(
        (t)=>t.toJson()
        ,(u)=>u.toJson())));
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
  }

  Future<void> deleteAll() async {
    final ids = ref.read(selectedIdsProvider);
    for (final id in ids) {
      await deleteDict(id);
    }
  }

  Future<void> changeFolderName(String nodeId,String newName,)async{
    final root = await future;
    final node = root.readNodeById(nodeId: nodeId);
    if(node==null) return;

    state = AsyncData(root.updateNode(
        nodeId: nodeId, node:node.copyWith(value: node.value.copyWith(title: newName))));
  }

    Future<void> changeDictName(String dictId,String newName,)async{
    final root = await future;
    final dict = root.readLeafById(id: dictId);
    if(dict==null) return;

    state = AsyncData(root.updateLeaf(leafId: dictId, leaf: dict.copyWith(value:
    dict.value.copyWith(title: newName))));
  }

  Future<void> moveFolder(String folderId,String newParentId)async{
    final root = await future;
    final folder = root.readNodeById(nodeId: folderId);
    final parent = root.readNodeById(nodeId: newParentId);
    if(folder==null || parent==null) return;
    var result = root;
    result = result.deleteNodeById(nodeId: folderId) ?? result;
    result = result.createNode(nodeId: newParentId, node: folder);
    state = AsyncData(result);
  }

  Future<void> moveDict(String dictId,String newParentId)async{
    final root = await future;
    final dict = root.readLeafById(id: dictId);
    final parent = root.readNodeById(nodeId: newParentId);
    if(dict==null || parent==null) return;
    var result = root;
    result = result.deleteLeafById(leafId: dictId);
    result = result.createLeaf(nodeId: newParentId, leaf:dict);
    state = AsyncData(result);
  }


  // for json serializable test
  Future<void> test()async{
    final previousState = await future;
    state = AsyncData(previousState.updateNode(
      nodeId: previousState.id, node: Node(value:
      FolderMetadata(title: 'root', createdAt: DateTime.now()) 
      , subTrees: [
        Node(value: FolderMetadata(title: 'newFolder', createdAt: DateTime.now()), subTrees:[])
      ])));
    saveData();
  }

  Future<void> addNewDict({
    required String nodeId
  })async{
    /*
    1. pick audio file
    2. save audio file to app documents directory with random path
    3. get Transcript model by api_helper and audio data
    4. get Dict data from Transcript model
    5. add Dict data to specified node

    if error occur while above process,
    delete saved audio data and show alert dialog
    */
  }
}