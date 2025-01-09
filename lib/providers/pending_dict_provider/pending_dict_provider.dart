import 'package:dict_app/models/pending_dict_data.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pending_dict_provider.g.dart';

@riverpod
class PendingDictListNotifier extends _$PendingDictListNotifier {
  @override
  List<PendingDictData> build() {
    return [];
  }

  Future<void> tryAddNewDict({required String nodeId, String? title}) async {
    final pendingData = PendingDictData(
      title: title ?? '新規ディクテーション', 
      createdAt: DateTime.now(), parentId: nodeId, 
      loadDict: ref.read(dataTreeNotifierProvider.notifier).addNewDict(nodeId: nodeId,title: title));
    state = [pendingData,...state];
  }
}