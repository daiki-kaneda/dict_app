import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/listening_view/listening_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/print_view/dictation.dart';
import 'package:dict_app/isar_widgets/file_details_view/print_view/print_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/stats_view/stats_view.dart';
import 'package:dict_app/isar_widgets/setting_view/setting_view.dart';
import 'package:dict_app/isar_widgets/utils/platform_action_sheet.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:dict_app/providers/model_provider/llm_role.dart';
import 'package:dict_app/providers/model_provider/model_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class FileDetailsView extends ConsumerWidget {
  const FileDetailsView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(ModelNotifierProvider(role: TranslateSenteces(id)));

    final file = ref.watch(fileNotifierProvider(id));
    if (file == null) LoadingPage();

    final index = ref.watch(currentTabIndexProvider);
    ref.listen(currentTabIndexProvider, (prev, next) {
      print('previous tabIndex:$prev,next tabIndex:$next');
    });
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: FileNavTitle(),
          trailingActions: [FileNavTrailing(id)],
        ),
        body: [
          DictationView(id),
          ListeningView(id),
          PrintView(id),
        ][index]);
  }
}

class FileNavTitle extends ConsumerWidget {
  const FileNavTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('data');
  }
}

class FileNavTrailing extends ConsumerWidget {
  const FileNavTrailing(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentTabIndexProvider);
    final file = ref.watch(fileNotifierProvider(fileId));
    final setting = ref.watch(settingNotifierProvider).value;
    if (file == null||setting==null) return Container();
    if (currentIndex == 0) {
      return ShowStatsButton(fileId);
    } else if (currentIndex == 2) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ShowSettingViewButton(fileId),
          SizedBox(
            width: 10,
          ),
          PlatformIconButton(
              onPressed: () {
                showCustomActionSheet(
                    isCupertino: true,
                    context: context,
                    actions: [
                      ActionSheetAction('プリント', isDefaultAction: true,
                          onTap: () {
                        Printing.layoutPdf(
                            onLayout: (format) => generateDictationDocument(
                                format, DictationDocumentData(file: file,setting: setting)));
                      }),
                      ActionSheetAction('シェア', isDefaultAction: true,
                          onTap: () async {
                        Printing.sharePdf(
                            bytes: await generateDictationDocument(
                                PdfPageFormat.a4,
                                DictationDocumentData(file: file,setting: setting)));
                      }),
                    ]);
              },
              icon: Icon(PlatformIcons(context).share)),
        ],
      );
    }
    return Container();
  }
}
