import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dict_app/models/data_tree/dictation_data_model/dictation_data_model.dart';
import 'package:dict_app/models/data_tree/item.dart';
import 'package:dict_app/models/setting.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:dict_app/widgets/app.dart';
import 'package:dict_app/widgets/utils/platform_dialog.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DictationDocumentData {
  const DictationDocumentData({
    required this.file,
    required this.setting,
  });

  final File file;
  final Setting setting;
}

Future<Uint8List> generateDictationDocument(
    PdfPageFormat format, DictationDocumentData data) async {
  final file = data.file;
  final setting = data.setting;
  final sentences = file.getAllSentences;
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  final englishFont = await _getFont('en');
  final localizedFont = await _getFont(setting.translationTargetLanguageCode);
  if (localizedFont == null) {
    showNotifyDialog(navigatorKey.currentContext!,
        title: l10n().errorDialogTitle, description: l10n().fontOfflineErrorDialogContent);
  }

  doc.addPage(
    pw.MultiPage(
      theme: pw.ThemeData.withFont(base: englishFont),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) =>
          context.pageNumber == 1 ? pw.SizedBox() : _buildHeader(context, file),
      footer: (pw.Context context) => _buildFooter(context, setting),
      build: (pw.Context context) => [
        pw.Header(level: 1, text: file.title),
        ..._buildDictationContent(context, sentences, setting, file,localizedFont: localizedFont),
      ],
    ),
  );

  if (setting.appendAnswer) {
    doc.addPage(
      pw.MultiPage(
        theme: pw.ThemeData.withFont(base: englishFont),
        pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
        orientation: pw.PageOrientation.portrait,
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        header: (pw.Context context) => _buildHeader(context, file),
        footer: (pw.Context context) => _buildFooter(context, setting,
            showPageNumbers: false),
        build: (pw.Context context) => [
          pw.Header(level: 2, text: 'Answers'),
          ..._buildAnswerContent(context, sentences, setting, file,localizedFont: localizedFont),
        ],
      ),
    );
  }

  return await doc.save();
}

pw.Widget _buildHeader(pw.Context context, File file) {
  return pw.Container(
    alignment: pw.Alignment.centerRight,
    margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
    padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
    decoration: const pw.BoxDecoration(
      border:
          pw.Border(bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey)),
    ),
    child: pw.Text(
      file.title,
      style:
          pw.Theme.of(context).defaultTextStyle.copyWith(color: PdfColors.grey),
    ),
  );
}

pw.Widget _buildFooter(pw.Context context, Setting setting,
    {bool showPageNumbers = true}) {
  return pw.Container(
    alignment: pw.Alignment.centerRight,
    margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
    child: pw.Text(
      showPageNumbers && setting.showPageNumbers
          ? 'Page ${context.pageNumber} of ${context.pagesCount}'
          : '',
      style:
          pw.Theme.of(context).defaultTextStyle.copyWith(color: PdfColors.grey),
    ),
  );
}

List<pw.Widget> _buildDictationContent(pw.Context context,
    List<DictationSentence> sentences, Setting setting, File file,{required pw.Font? localizedFont}) {
  return sentences.indexed
      .map((t) =>
          _buildSentenceSection(context, t, setting, file, isAnswer: false,localizedFont: localizedFont))
      .toList();
}

List<pw.Widget> _buildAnswerContent(pw.Context context,
    List<DictationSentence> sentences, Setting setting, File file,{required pw.Font? localizedFont}) {
  return sentences.indexed
      .map((t) =>
          _buildSentenceSection(context, t, setting, file, isAnswer: true,localizedFont: localizedFont))
      .toList();
}

pw.Widget _buildSentenceSection(
    pw.Context context, (int, DictationSentence) t, Setting setting, File file,
    {required bool isAnswer,required pw.Font? localizedFont}) {
  final textStyle = pw.TextStyle(fontSize: 0.8 * PdfPageFormat.cm);
  final smallTextStyle = pw.TextStyle(fontSize: 0.5 * PdfPageFormat.cm);
  final greyTextStyle =
      pw.TextStyle(fontSize: 0.5 * PdfPageFormat.cm, color: PdfColors.grey);

  String maskWord(String word, Setting setting) {
    if (isAnswer) return word;

    return '${setting.separateWordsWithParentheses ? '(' : ''}${word.replaceAll(setting.hideOnlyAlphabet ? RegExp(r'[a-zA-Z]') : RegExp(r'.'), setting.showUnderlinedParts ? '_' : ' ')}${setting.separateWordsWithParentheses ? ')' : ''}';
  }

  return pw.Column(
    crossAxisAlignment: pw.CrossAxisAlignment.stretch,
    mainAxisSize: pw.MainAxisSize.min,
    children: [
      pw.Wrap(
        spacing: isAnswer ? 2 * PdfPageFormat.mm : 5 * PdfPageFormat.mm,
        children: t.$2.words!
            .map((w) => pw.Text(
                isAnswer ? w.displayText : maskWord(w.displayText, setting),
                style: isAnswer
                    ? smallTextStyle
                    : textStyle.copyWith(
                        letterSpacing: setting.connectUnderlinedParts
                            ? 0
                            : 1 * PdfPageFormat.mm,
                      )))
            .toList(),
      ),
      if (setting.appendTranslation)
        pw.Padding(
          padding: pw.EdgeInsets.only(top: 0.3 * PdfPageFormat.cm),
          child: pw.Builder(
            builder: (context) {
              final translatedSentence = file.paragraphs
                  .translatedSentences(setting.translationTargetLanguageCode)
                  .elementAtOrNull(t.$1);
              return pw.Text(translatedSentence ?? '', style: smallTextStyle.copyWith(
                font: localizedFont
              ));
            },
          ),
        ),
      pw.Text(
        'Audio: ${formatDuration(Duration(milliseconds: (t.$2.start! * 1000).toInt()))} - ${formatDuration(Duration(milliseconds: (t.$2.end! * 1000).toInt()))}',
        textAlign: pw.TextAlign.right,
        style: greyTextStyle,
      ),
      pw.Padding(padding: pw.EdgeInsets.only(top: 1 * PdfPageFormat.cm)),
    ],
  );
}

Future<pw.Font?> _getFont(String languageCode) async {
  pw.Font? font;
  try {
    switch (languageCode) {
      case 'ja':
        font = await PdfGoogleFonts.notoSansJPRegular();
        break;
      case 'ko':
        font = await PdfGoogleFonts.notoSansKRRegular();
        break;
      case 'zh':
        font = await PdfGoogleFonts.notoSansSCRegular();
        break;
      case 'hi':
        font = await PdfGoogleFonts.notoSansDevanagariRegular();
        break;
      case 'bn':
        font = await PdfGoogleFonts.notoSansBengaliRegular();
        break;
      case 'ta':
        font = await PdfGoogleFonts.notoSansTamilRegular();
        break;
      case 'ar':
      case 'ur':
      case 'fa':
        font = await PdfGoogleFonts.notoSansArabicRegular();
        break;
      default:
        font = await PdfGoogleFonts.notoSansRegular();
    }
    return font;
  } catch (e) {
    print(e);
    return null;
  }
}
