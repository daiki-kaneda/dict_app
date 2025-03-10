import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


// This class is responsible for save,load,delete specific bytes file to ApplicationDocumentsDirectory
class AppDocumentsHelper{

  late final String appDocumentDir;

  Future<void> init()async{
    appDocumentDir = (await getApplicationDocumentsDirectory()).path;
  }

  String fullPath(String filePath){
    return p.join(appDocumentDir,filePath);
  }

  Future<String?> saveFile(
    String filePath,Uint8List bytes
  )async{
    try{
      
      final path = fullPath(filePath);
      await File(path).create(recursive: true);
      await File(path).writeAsBytes(bytes);

      return filePath;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<Uint8List?> loadFile(
    String filePath
  )async{
    try{
      final path =  fullPath(filePath);
      return await File(path).readAsBytes();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future<void> deleteFile(
    String filePath
  )async{
    try{
      final path =  fullPath(filePath);
      await File(path).delete(recursive: true);
    }catch(e){
      print(e.toString());
    }
  }

  Future<List<String>?> fileNames()async{
    final directory = Directory(appDocumentDir);
    if(await directory.exists()){
      return directory.listSync()
      .whereType<File>().map((e)=>e.path
      .split('/').lastOrNull).whereType<String>().toList();
    }
    return null;
  }
}