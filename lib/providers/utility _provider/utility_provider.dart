import 'dart:developer';

import 'package:dict_app/extension/extension.dart';
import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'utility_provider.g.dart';

@riverpod
class CurrentTreeIdNotifier extends _$CurrentTreeIdNotifier {
  @override
  FutureOr<String> build() async {
    final root = await ref.read(dataTreeNotifierProvider.future);

    // for debug
    ref.listenSelf((prev, next) {
      if (prev?.value != next.value) {
        log('changed current id to ${next.value} from ${prev?.value}');
      }
    });
    return root.id;
  }

  void updateId(String newId) {
    state = AsyncData(newId);
  }

  // when pop,current id must be updated to parent id
  Future<void> updateToParentId() async {
    final root = await ref.read(dataTreeNotifierProvider.future);
    final currentId = await future;
    final parentId = root.parentId(childId: currentId);
    log('parentId is $parentId');

    if (parentId != null) state = AsyncData(parentId);
  }
}

@riverpod
Future<bool> canPop(CanPopRef ref) async {
  final root = await ref.watch(dataTreeNotifierProvider.future);
  final currentId = await ref.watch(currentTreeIdNotifierProvider.future);
  return root.id != currentId;
}

@riverpod
class IsEditingNotifier extends _$IsEditingNotifier {
  @override
  bool build() {
    return false;
  }

  void updateMode(bool isEditing) {
    state = isEditing;
  }
}

@riverpod
Future<bool> isDictShowing(IsDictShowingRef ref) async {
  final root = await ref.watch(dataTreeNotifierProvider.future);
  final currentId = await ref.watch(currentTreeIdNotifierProvider.future);
  return root.leaves().map((l) => l.id).contains(currentId);
}

@riverpod
class SelectedIds extends _$SelectedIds {
  @override
  Set<String> build() {
    ref.listen(isEditingNotifierProvider, (prev, next) {
      if (prev == true && !next) {
        clear();
      }
    });
    return {};
  }

  void updateIds(Set<String> newIds) {
    state = newIds;
  }

  void toggle(String id) {
    final selected = state.contains(id);
    if (selected) {
      removeId(id);
    } else {
      addId(id);
    }
  }

  void addId(String id) {
    final newIds = {...state, id};
    state = newIds;
  }

  void removeId(String id) {
    state = state.where((i) => i != id).toSet();
  }

  void clear() {
    state = {};
  }
}

@riverpod
class IsSheetShowing extends _$IsSheetShowing{
  @override
  bool build() {
    return false;
  }

  void updateValue(bool isShowing) {
    state = isShowing;
  }
}

@riverpod
class ExpansionNotifier extends _$ExpansionNotifier {
  @override
  bool build(String id) {
    return true;
  }

  void expand(){
    state=true;
  }

  void collapse(){
    state=false;
  }

  void toggle(){
    state = !state;
  }
}

@riverpod
class ParagraphIndexNotifier extends _$ParagraphIndexNotifier {
  @override
  int build() {
    return -1;
  }

  void updateIndex(int index){
    state = index;
  }
}

@riverpod
class SentenceIndexNotifier extends _$SentenceIndexNotifier {
  @override
  int build() {
    return -1;
  }

  void updateIndex(int index){
    state = index;
  }
}

@riverpod
class WordIndexNotifier extends _$WordIndexNotifier {
  @override
  int build() {
    return -1;
  }

  void updateIndex(int index){
    state = index;
  }
}

@riverpod
FutureOr<DictationWord?> selectedWord(SelectedWordRef ref) {
  final dictId = ref.watch(currentTreeIdNotifierProvider);
  if(dictId.value==null) return null;
  final paragpraphs = ref.watch(dataTreeNotifierProvider.select(
    (tree)=>tree.value?.readLeafById(id: dictId.value!)?.value.paragraphs
  ));
  if(paragpraphs==null) return null;
  final paragraphIndex = ref.watch(paragraphIndexNotifierProvider);
  final sentenceIndex = ref.watch(sentenceIndexNotifierProvider);
  final wordIndex = ref.watch(wordIndexNotifierProvider);

  return paragpraphs.paragraphs.elementAtOrNull(paragraphIndex)
  ?.sentences.elementAtOrNull(sentenceIndex)?.words.elementAtOrNull(wordIndex);
}

@riverpod
FutureOr<DictationSentence?> selectedSentence(SelectedSentenceRef ref) {
  final dictId = ref.watch(currentTreeIdNotifierProvider);
  if(dictId.value==null) return null;
  final paragpraphs = ref.watch(dataTreeNotifierProvider.select(
    (tree)=>tree.value?.readLeafById(id: dictId.value!)?.value.paragraphs
  ));
  if(paragpraphs==null) return null;
  final paragraphIndex = ref.watch(paragraphIndexNotifierProvider);
  final sentenceIndex = ref.watch(sentenceIndexNotifierProvider);

  return paragpraphs.paragraphs.elementAtOrNull(paragraphIndex)
  ?.sentences.elementAtOrNull(sentenceIndex);
}

@riverpod
FutureOr<DictationParagraph?> selectedParagraph(SelectedParagraphRef ref) {
  final dictId = ref.watch(currentTreeIdNotifierProvider);
  if(dictId.value==null) return null;
  final paragpraphs = ref.watch(dataTreeNotifierProvider.select(
    (tree)=>tree.value?.readLeafById(id: dictId.value!)?.value.paragraphs
  ));
  if(paragpraphs==null) return null;
  final paragraphIndex = ref.watch(paragraphIndexNotifierProvider);

  return paragpraphs.paragraphs.elementAtOrNull(paragraphIndex);
}