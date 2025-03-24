
import 'package:dict_app/my_dict/models/data_tree_isar/item.dart';
import 'package:dict_app/my_dict/providers/isar_database_provider/isar_provider.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_provider.g.dart';

@riverpod
Folder? folder(FolderRef ref, Id id) {
  final isar = ref.read(isarProvider).requireValue;
  return isar.folders.filter().idEqualTo(id).findFirstSync();
}
