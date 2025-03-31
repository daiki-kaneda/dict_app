import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dict_app/widgets/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

bool isAlphabet(String character) {
  final rxp = RegExp(r'[a-zA-Z]');
  return rxp.hasMatch(character);
}

String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

String formatDateTime(DateTime dateTime, String locale) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
  final endOfWeek = startOfWeek.add(const Duration(days: 6));

  if (dateTime.isAfter(today) &&
      dateTime.isBefore(today.add(const Duration(days: 1)))) {
    // 今日の日付の場合
    return DateFormat('HH:mm').format(dateTime);
  } else if (dateTime.isAfter(startOfWeek) &&
      dateTime.isBefore(endOfWeek.add(const Duration(days: 1)))) {
    // 今週の日付の場合
    return DateFormat.EEEE(locale).format(dateTime); // 曜日を日本語で表示
  } else {
    // 今日でも今週でもない場合
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }
}

final int maxSizeMbs = 999999999999999;
final int maxAudioLengthInSeconds = 180;

bool validateAudioSize(int size, int maxMbs) {
  return maxMbs > (size / (1024 * 1024));
}

Future<bool> validateAudioLength(String url) async {
  final tempPlayer = AudioPlayer();
  await tempPlayer.setSourceDeviceFile(url);
  final audioLength = (await tempPlayer.getDuration())?.inSeconds;
  print('audio length :$audioLength seconds');
  tempPlayer.dispose();
  return (audioLength ?? 9999) <= maxAudioLengthInSeconds;
}

extension ListEx<T> on List<List<T>> {
  List<T> concat() {
    return reduce((l1, l2) => l1 + l2);
  }
}

extension NumListEx on Iterable<double> {
  double get mean =>
      isEmpty ? double.nan : (reduce((a, b) => (a + b)) / length).toDouble();
}

void hideKeyboard() {
  SystemChannels.textInput.invokeMethod('TextInput.hide');
}

Color transitionalColor({Color? begin, Color? end, double progress = 0}) {
  final colorTween = ColorTween(begin: begin, end: end);
  return colorTween.transform(progress.clamp(0.0, 1.0)) ?? Colors.transparent;
}

String formatBytes(int bytes, {int decimals = 2}) {
  if (bytes <= 0) return "0 B";

  const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
  int i = 0;
  double size = bytes.toDouble();

  while (size >= 1024 && i < suffixes.length - 1) {
    size /= 1024;
    i++;
  }

  final String formattedSize = (decimals == 0)
      ? NumberFormat("#,##0").format(size)
      : NumberFormat("#,##0.${"#" * decimals}").format(size);

  return "$formattedSize ${suffixes[i]}";
}

List<T> past24hoursListBuilder<T>(
    DateTime now, T Function(DateTime start, DateTime end) elementBuilder) {
  final end = DateTime(now.year, now.month, now.day, 23, 59, 59);
  return List.generate(24, (i) {
    return elementBuilder(
        end.subtract(Duration(hours: i + 1)), end.subtract(Duration(hours: i)));
  }).reversed.toList();
}

List<T> pastWeekListBuilder<T>(
    DateTime now, T Function(DateTime start, DateTime end) elementBuilder) {
  final end = DateTime(now.year, now.month, now.day, 23, 59, 59);
  return List.generate(7, (i) {
    return elementBuilder(
        end.subtract(Duration(days: i + 1)), end.subtract(Duration(days: i)));
  }).reversed.toList();
}

List<T> pastMonthListBuilder<T>(
    DateTime now, T Function(DateTime start, DateTime end) elementBuilder) {
  final end = DateTime(now.year, now.month, now.day, 23, 59, 59);
  final dayCount = DateTime(now.year, now.month + 1, 0).day;
  return List.generate(dayCount, (i) {
    return elementBuilder(
        end.subtract(Duration(days: i + 1)), end.subtract(Duration(days: i)));
  }).reversed.toList();
}

List<T> past6MonthsListBuilder<T>(
    DateTime now, T Function(DateTime start, DateTime end) elementBuilder) {
  return List.generate(6, (i) {
    return elementBuilder(DateTime(now.year, now.month - i, 1),
        DateTime(now.year, now.month - i + 1, 0, 23, 59, 59));
  }).reversed.toList();
}

List<T> pastYearListBuilder<T>(
    DateTime now, T Function(DateTime start, DateTime end) elementBuilder) {
  return List.generate(12, (i) {
    return elementBuilder(DateTime(now.year, now.month - i, 1),
        DateTime(now.year, now.month - i + 1, 0, 23, 59, 59));
  }).reversed.toList();
}

List<String> past24hoursTitleList(DateTime now, {String? locale}) {
  return past24hoursListBuilder(
      now, (_, end) => DateFormat.H(locale).format(end));
}

List<String> pastWeekTitleList(DateTime now, {String? locale}) {
  return pastWeekListBuilder(now, (_, end) => DateFormat.E(locale).format(end));
}

List<String> pastMonthTitleList(DateTime now, {String? locale}) {
  return pastMonthListBuilder(
      now, (_, end) => DateFormat.d(locale).format(end));
}

List<String> past6MonthsTitleList(DateTime now, {String? locale}) {
  return past6MonthsListBuilder(
      now, (_, end) => DateFormat.MMM(locale).format(end));
}

List<String> pastYearTitleList(DateTime now, {String? locale}) {
  return pastYearListBuilder(now, (_, end) => DateFormat.M(locale).format(end));
}

TextSpan iconTextSpan(IconData icon, {Color? color, double? size}) => TextSpan(
      text: String.fromCharCode(icon.codePoint),
      style: TextStyle(
        inherit: false,
        color: color,
        fontSize: size,
        fontFamily: icon.fontFamily,
        package: icon.fontPackage,
      ),
    );

TextSpan iconDescriptionTextSpan(BuildContext context,
    {required IconData icon, double fontSize = 24, String description = ''}) {
  return TextSpan(children: [
    iconTextSpan(icon,
        color: Platform.isIOS
            ? CupertinoTheme.of(context).primaryColor
            : Theme.of(context).colorScheme.primary,
        size: fontSize),
    TextSpan(text: ': $description', style: TextStyle(fontSize: fontSize))
  ]);
}

bool isTablet(BuildContext context){
  return MediaQuery.of(context).size.width > 600;
}

AppLocalizations l10n(){
  try{
  return AppLocalizations.of(navigatorKey.currentContext!)!;
  }catch(e){
    print(e);
    throw Exception('Could not get Applocalization');
  }
}

String platformLocaleName(){
  return Platform.localeName;
}

String platformLanguageCode(){
  return Localizations.localeOf(navigatorKey.currentContext!).languageCode;
}
