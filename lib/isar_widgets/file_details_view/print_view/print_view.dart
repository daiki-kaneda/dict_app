import 'dart:io';

import 'package:dict_app/isar_widgets/bottom_shell_widget.dart';
import 'package:dict_app/isar_widgets/file_details_view/print_view/dictation.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';

class PrintView extends ConsumerStatefulWidget {
  const PrintView(this.fileId, {super.key});

  final int fileId;

  @override
  ConsumerState<PrintView> createState() => _PrintViewState();
}

class _PrintViewState extends ConsumerState<PrintView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(settingNotifierProvider.notifier).createTranslatedSentences(widget.fileId);
      debugPrint('PrintView initialized with fileId: ${widget.fileId}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final file = ref.watch(fileNotifierProvider(widget.fileId));
    final setting = ref.watch(settingNotifierProvider).value;

    if (file == null || setting == null) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

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
                      color:
                          CupertinoColors.systemBackground.resolveFrom(context))
                  : null,
              maxPageWidth: 700,
              build: (format) => generateDictationDocument(
                format,
                DictationDocumentData(file: file, setting: setting),
              ),
            ),
          ),
          const BottomShellWidgetPlaceHolder(),
        ],
      ),
    );
  }
}