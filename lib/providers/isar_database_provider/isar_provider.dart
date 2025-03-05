
import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

@riverpod
Future<Isar> isar(IsarRef ref)async{
  final dir = await getApplicationDocumentsDirectory();
  final isar =Isar.open([FolderSchema,FileSchema], directory: dir.path);
  return isar;
}