import 'dart:io';

import 'package:dict_app/isar_widgets/utils/platform_linear_indicator.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageProgressIndicator extends ConsumerWidget {
  const PageProgressIndicator(this.fileId, {super.key});
  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageLength = ref.read(fileNotifierProvider(fileId)
        .select((f) => f?.getAllSentences?.length ?? 1));
    final controller = ref.watch(sentencePageControllerProvider(fileId));

    return AnimatedPlatformPageViewLinearIndicator(controller,
        pageLength: pageLength);
  }
}

class DictationCompletionRateIndicator extends ConsumerWidget {
  const DictationCompletionRateIndicator(this.fileId,
      {super.key, this.alphabetOnly = true});

  final int fileId;
  final bool alphabetOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIOS = Platform.isIOS;
    final completionRate =
        ref.watch(completionRateProvider(fileId, alphabetOnly: alphabetOnly));
    final showWordSuccessEffect =
        ref.watch(showWordSuccessEffectProvider(fileId));
    final showSentenceSuccessEffect =
        ref.watch(showSentenceSuccessEffectProvider(fileId));
    final showSectionSuccessEffect =
        ref.watch(showSectionSuccessEffectProvider(fileId));

    final wordSuccessColor = isIOS
        ? CupertinoColors.systemGreen.resolveFrom(context)
        : Colors.greenAccent;
    final sentenceSuccessColor = isIOS
        ? CupertinoColors.systemOrange.resolveFrom(context)
        : Colors.orangeAccent;
    final sectionSuccessColor = isIOS
        ? CupertinoColors.systemBlue.resolveFrom(context)
        : Colors.blueAccent;
    final normalColor = isIOS
        ? CupertinoColors.systemTeal.resolveFrom(context)
        : Colors.tealAccent;

    return AnimatedPlatformLinearIndicator(
        progress: completionRate,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
        activeColor: showSectionSuccessEffect
            ? sectionSuccessColor
            : (showSentenceSuccessEffect
                ? sentenceSuccessColor
                : (showWordSuccessEffect ? wordSuccessColor : normalColor)));
  }
}
