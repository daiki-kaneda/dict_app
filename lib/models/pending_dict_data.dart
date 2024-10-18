import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:dict_app/models/data_tree/dict_data/transcript_model.dart';


class PendingDictData {
  final String title;
  final DateTime createdAt;
  final String parentId;

  final Future<void> loadDict;

  const PendingDictData(
      {required this.title,
      required this.createdAt,
      required this.parentId,
      required this.loadDict
      });

  PendingDictData copyWith({
    String? title,
    DateTime? createdAt,
    String? parentId,
    Future<void>? loadDict,
  }) {
    return PendingDictData(
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      parentId: parentId ?? this.parentId,
      loadDict: loadDict ?? this.loadDict
    );
  }
  

  
}