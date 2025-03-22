import 'dart:typed_data';

import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DictationDocumentData {
  const DictationDocumentData({
    required this.file,
    this.hasAnswer = false,
    this.hasTranslation = false,
    this.testing = false,
  });
  final File file;
  final bool hasTranslation;
  final bool hasAnswer;
  final bool testing;
}

Future<Uint8List> generateDictationDocument(
    PdfPageFormat format, DictationDocumentData data) async {
  final file = data.file;
  final sentences = file.getAllSentences;
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  if (sentences == null) return await doc.save();

  final font1 = data.testing
      ? pw.Font.helvetica()
      : await PdfGoogleFonts.openSansRegular();
  final font2 = data.testing
      ? pw.Font.helveticaBold()
      : await PdfGoogleFonts.openSansBold();

  doc.addPage(pw.MultiPage(
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        if (context.pageNumber == 1) {
          return pw.SizedBox();
        }
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
                border: pw.Border(
                    bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey))),
            child: pw.Text(file.title,
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
            pw.Header(level: 1, text: file.title),
            for (final t in file.paragraphs.getAllSentences!.indexed) ...[
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisSize: pw.MainAxisSize.min,
                  children: [
                    pw.Wrap(spacing: 5 * PdfPageFormat.mm, children: [
                      for (final w in t.$2.words!.map((w) => w.displayText))
                        pw.Text(w.replaceAll(RegExp(r'[a-zA-Z]'), '_'),
                            style:
                                pw.TextStyle(fontSize: 0.8 * PdfPageFormat.cm,
                            letterSpacing: 1*PdfPageFormat.mm))
                    ]),
                    pw.Text(
                      'Audio: ${formatDuration(Duration(milliseconds: (t.$2.start! * 1000).toInt()))} - ${formatDuration(Duration(milliseconds: (t.$2.end! * 1000).toInt()))}',
                      textAlign: pw.TextAlign.right,
                      style: pw.TextStyle(
                          fontSize: 0.5 * PdfPageFormat.cm,
                          color: PdfColors.grey),
                    ),
                    pw.Padding(
                        padding: pw.EdgeInsets.only(top: 1 * PdfPageFormat.cm))
                  ])
            ]
          ]));
  
    doc.addPage(pw.MultiPage(
      theme: pw.ThemeData.withFont(
        base: font1,
        bold: font2,
      ),
      pageFormat: format.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      orientation: pw.PageOrientation.portrait,
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      header: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const pw.EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const pw.BoxDecoration(
                border: pw.Border(
                    bottom: pw.BorderSide(width: 0.5, color: PdfColors.grey))),
            child: pw.Text(file.title,
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      footer: (pw.Context context) {
        return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: pw.Text(
                'Page ${context.pageNumber} of ${context.pagesCount}',
                style: pw.Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey)));
      },
      build: (pw.Context context) => <pw.Widget>[
            pw.Header(level: 2, text: 'Answers'),
            for (final t in file.paragraphs.getAllSentences!.indexed) ...[
              pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.stretch,
                  mainAxisSize: pw.MainAxisSize.min,
                  children: [
                    pw.Wrap(spacing: 2 * PdfPageFormat.mm, children: [
                      for (final w in t.$2.words!.map((w) => w.displayText))
                        pw.Text(w,
                            style:
                                pw.TextStyle(fontSize: 0.5 * PdfPageFormat.cm))
                    ]),
                    pw.Text(
                      'Audio: ${formatDuration(Duration(milliseconds: (t.$2.start! * 1000).toInt()))} - ${formatDuration(Duration(milliseconds: (t.$2.end! * 1000).toInt()))}',
                      textAlign: pw.TextAlign.right,
                      style: pw.TextStyle(
                          fontSize: 0.5 * PdfPageFormat.cm,
                          color: PdfColors.grey),
                    ),
                    pw.Padding(
                        padding: pw.EdgeInsets.only(top: 1 * PdfPageFormat.cm))
                  ])
            ]
          ]));


  return await doc.save();
}
