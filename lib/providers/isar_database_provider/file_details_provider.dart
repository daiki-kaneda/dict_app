import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/models/data_tree_isar/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:dict_app/providers/api_helper_provider/api_helper_provider.dart';
import 'package:dict_app/providers/app_documents_directory_provider/app_documents_directory_provider.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/file_picker_provider/file_picker_provider.dart';
import 'package:dict_app/providers/isar_database_provider/isar_provider.dart';
import 'package:dict_app/utils/dialog.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_details_provider.g.dart';

// This [PageController] must autodispose to avoid More than one [PageView] using the same [PageController]
@riverpod
class SentencePageController extends _$SentencePageController {
  @override
  PageController build() {
    final controller = PageController();
    controller.addListener(_onPageChanged);
    ref.onDispose(() {
      controller.removeListener(_onPageChanged);
      controller.dispose();
    });

    return controller;
  }

  void _onPageChanged() {
    final page = state.page;
    if (page == null || page.toInt() != page) return;
    print('currentPage:$page');
    ref.read(currentSentenceIndexProvider.notifier).updateIndex(page.toInt());
  }
}

@riverpod
class CurrentSentenceIndex extends _$CurrentSentenceIndex {
  @override
  int build() {
    listenSelf((_, __) {
      final currentSentence = getCurrentSentence();
      final (start, end) = (currentSentence?.start, currentSentence?.end);
      if (start != null && end != null) {
        print((start,end));
        // ref.read(startEndProviderProvider.notifier).setNewValue(start, end);
      }
    });
    return 0;
  }

  Isar get isar => ref.read(isarProvider).requireValue;

  DictationSentence? getCurrentSentence(){
  final isar = ref.read(isarProvider).requireValue;
  final fileId = PathParamerterKeys.fileId.getCurrentValue();
  if (fileId == null) return null;

  final targetSentence = isar.files
      .filter()
      .idEqualTo(fileId)
      .findAllSync()
      .firstOrNull
      ?.getAllSentences?[state];
  print(('currentText:${targetSentence?.displayText}'));
  return targetSentence;
  }

  updateIndex(int index) {
    state = index;
  }
}


