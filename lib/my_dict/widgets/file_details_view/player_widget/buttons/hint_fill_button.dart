import 'dart:io';

import 'package:dict_app/my_dict/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/my_dict/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HintFillButton extends ConsumerWidget {
  const HintFillButton(this.fileId,{super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return PlatformIconButton(
      onPressed: (){
        final paragraphIndex = ref.read(currentParagraphIndexProvider(fileId));
        final sentenceIndex = ref.read(currentSentenceIndexProvider(fileId));
        final wordIndex = ref.read(currentWordIndexProvider(fileId));
        ref.read(fileNotifierProvider(fileId).notifier)
        .tryCharacter(
          input: '', 
          paragraphIndex: paragraphIndex, 
          sentenceIndex: sentenceIndex, 
          wordIndex: wordIndex,
          solveAnyway: true);
      },
      icon: Icon(
        Platform.isIOS ? CupertinoIcons.eye_fill:Icons.visibility,
        color: Platform.isIOS? CupertinoColors.label.resolveFrom(context):null,),);
  }
}