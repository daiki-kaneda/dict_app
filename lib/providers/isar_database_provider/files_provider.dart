import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/isar_widgets/utils/platform_dialog.dart';
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/isar_provider.dart';
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