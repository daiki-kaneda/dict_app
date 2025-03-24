import 'dart:io';
import 'dart:typed_data';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


// This class is responsible for save,load,delete specific bytes file to ApplicationSupportDirectory
class AppSupportHelper{

  late final String appSupportDir;

  Future<void> init()async{
    appSupportDir = (await getApplicationSupportDirectory()).path;
  }

  String fullPath(String filePath){
    return p.join(appSupportDir,filePath);
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
    final directory = Directory(appSupportDir);
    if(await directory.exists()){
      return directory.listSync()
      .whereType<File>().map((e)=>e.path
      .split('/').lastOrNull).whereType<String>().toList();
    }
    return null;
  }
}