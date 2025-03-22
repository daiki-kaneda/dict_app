import 'dart:io';

import 'package:dict_app/isar_widgets/bottom_shell_widget.dart';
import 'package:dict_app/isar_widgets/file_details_view/print_view/dictation.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/trailing_button/select_folder_list.dart/expansion_tile/custom_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

class PrintView extends ConsumerWidget {
  const PrintView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(fileNotifierProvider(fileId));
    if (file == null) return Container();

    return SafeArea(
        child: Column(
      children: [
        Expanded(
            child: PdfPreview(
          loadingWidget: Center(
            child: PlatformCircularProgressIndicator(),
          ),
          useActions: false,
          scrollViewDecoration: Platform.isIOS
              ? BoxDecoration(
                  color: CupertinoColors.systemBackground.resolveFrom(context))
              : null,
          maxPageWidth: 700,
          build: (format) => generateDictationDocument(
              format, DictationDocumentData(file: file)),
        )),
        BottomShellWidgetPlaceHolder()
      ],
    ));
  }
}