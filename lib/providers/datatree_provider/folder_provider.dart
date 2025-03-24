
import 'package:dict_app/models/data_tree/item.dart';
import 'package:dict_app/providers/datatree_provider/isar_provider.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'folder_provider.g.dart';

@riverpod
Folder? folder(FolderRef ref, Id id) {
  final isar = ref.read(isarProvider).requireValue;
  return isar.folders.filter().idEqualTo(id).findFirstSync();
}
