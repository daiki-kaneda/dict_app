import 'package:dict_app/my_dict/models/data_tree_isar/item.dart';
import 'package:dict_app/my_dict/providers/isar_database_provider/isar_provider.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'files_provider.g.dart';

@riverpod
class FilesNotifier extends _$FilesNotifier {
  @override
  List<File> build() {
    return [];
  }

  Isar get isar => ref.read(isarProvider).requireValue;

}