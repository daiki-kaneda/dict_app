import 'dart:io';

import 'package:dict_app/isar_widgets/utils/platform_linear_indicator.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/utils/utils.dart';
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

    final backgroundColor = Platform.isIOS
        ? CupertinoColors.systemGrey5.resolveFrom(context)
        : Colors.grey[300]!;
    final activeColor = isIOS
        ? CupertinoColors.systemGreen.resolveFrom(context)
        : Colors.greenAccent;

    return AnimatedPlatformLinearIndicator(
        progress: completionRate,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        backgroundColor: backgroundColor,
        activeColor: activeColor);
  }
}

class FileDictationProgressIndicator extends ConsumerWidget {
  const FileDictationProgressIndicator(this.fileId,
      {super.key, this.alphabetOnly = true});

  final int fileId;
  final bool alphabetOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completionRate =
        ref.watch(completionRateProvider(fileId, alphabetOnly: alphabetOnly));
    final backgroundColor = Platform.isIOS
        ? CupertinoColors.systemGrey5.resolveFrom(context)
        : Colors.grey[300]!;
    final activeColor = Platform.isIOS
        ? CupertinoColors.systemGreen.resolveFrom(context)
        : Colors.greenAccent;
    return PlatformLinearIndicator(
      backgroundColor: backgroundColor,
      progress: completionRate,
      activeColor: activeColor,
    );
  }
}


// class FolderDictationProgressIndicator extends ConsumerWidget {
//   const FolderDictationProgressIndicator(this.fileId,{super.key,this.alphabetOnly=true});

//   final int fileId;
//   final bool alphabetOnly;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//       final completionRate =
//         ref.watch(completionRateProvider(fileId, alphabetOnly: alphabetOnly));
//           final activeColor = Platform.isIOS
//         ? CupertinoColors.systemGreen.resolveFrom(context)
//         : Colors.greenAccent;
//     return PlatformLinearIndicator(
//       progress: completionRate,
//       activeColor: activeColor,);
//   }
// }