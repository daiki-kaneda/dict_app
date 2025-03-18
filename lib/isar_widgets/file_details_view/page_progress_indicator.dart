import 'package:dict_app/isar_widgets/utils/platform_linear_indicator.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageProgressIndicator extends ConsumerWidget {
  const PageProgressIndicator(this.fileId,{super.key});
  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageLength = ref.read(fileNotifierProvider(fileId).select(
      (f)=>f?.getAllSentences?.length ?? 1
    ));
    final controller = ref.watch(sentencePageControllerProvider(fileId));

    return AnimatedPlatformPageViewLinearIndicator(controller, pageLength: pageLength);
  }
}