import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:dict_app/providers/isar_database_provider/isar_provider.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_provider.g.dart';

@riverpod
File? file(FileRef ref, Id id) {
  final isar = ref.read(isarProvider).requireValue;
  return isar.files.filter().idEqualTo(id).findFirstSync();
}
