
import 'package:dict_app/models/data_tree/item.dart';
import 'package:dict_app/models/log_entry.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'isar_provider.g.dart';

@riverpod
Future<Isar> isar(IsarRef ref)async{
  final dir = await getApplicationSupportDirectory();
  final isar =Isar.open([FolderSchema,FileSchema,LogEntrySchema], directory: dir.path);
  return isar;
}