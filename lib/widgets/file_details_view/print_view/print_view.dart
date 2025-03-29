import 'dart:io';

import 'package:dict_app/providers/connectivity_provider/connectivity_provider.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:dict_app/widgets/app.dart';
import 'package:dict_app/widgets/bottom_shell_widget.dart';
import 'package:dict_app/widgets/file_details_view/print_view/dictation.dart';
import 'package:dict_app/widgets/utils/platform_action_sheet.dart';
import 'package:dict_app/providers/datatree_provider/file_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:dict_app/widgets/utils/platform_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:uuid/uuid.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref
          .read(settingNotifierProvider.notifier)
          .createTranslatedSentences(widget.fileId);

      final connection = await ref.read(connectivityProvider.future);
      if (connection != true) {
        showNotifyDialog(navigatorKey.currentContext!,
            title: l10n().errorDialogTitle,
            description: l10n().fontOfflineErrorDialogContent);
        return;
      }
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

class PDFShareOrPrintButton extends ConsumerWidget {
  const PDFShareOrPrintButton(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(fileNotifierProvider(fileId));
    final setting = ref.watch(settingNotifierProvider).value;
    if (file == null || setting == null) return Container();
    return PlatformIconButton(
        onPressed: () {
          showCustomActionSheet(isCupertino: true, context: context, actions: [
            ActionSheetAction('プリント', isDefaultAction: true, onTap: () {
              Printing.layoutPdf(
                  name: const Uuid().v4(),
                  onLayout: (format) => generateDictationDocument(format,
                      DictationDocumentData(file: file, setting: setting)));
            }),
            ActionSheetAction('シェア', isDefaultAction: true, onTap: () async {
              Printing.sharePdf(
                  filename: '${const Uuid().v4()}.pdf',
                  bytes: await generateDictationDocument(PdfPageFormat.a4,
                      DictationDocumentData(file: file, setting: setting)));
            }),
          ]);
        },
        icon: Icon(PlatformIcons(context).share));
  }
}
