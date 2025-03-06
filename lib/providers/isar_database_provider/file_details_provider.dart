// import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
// import 'package:dict_app/models/data_tree_isar/item.dart';
// import 'package:dict_app/providers/api_helper_provider/api_helper_provider.dart';
// import 'package:dict_app/providers/app_documents_directory_provider/app_documents_directory_provider.dart';
// import 'package:dict_app/providers/file_picker_provider/file_picker_provider.dart';
// import 'package:dict_app/providers/isar_database_provider/isar_provider.dart';
// import 'package:dict_app/utils/dialog.dart';
// import 'package:dict_app/utils/utils.dart';
// import 'package:isar/isar.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'file_details_provider.g.dart';

// @riverpod
// class DictationParagraphsByFileId extends _$DictationParagraphsByFileId {
//   @override
//   Stream<DictationParagraphs> build(int id) {
//     Query<File> fileById = isar.files.filter()
//     .idEqualTo(id)
//     .build();
//     return fileById.watch().map(
      
//     );
//   }
//   Isar get isar => ref.read(isarProvider).requireValue;
// }