import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

bool isAlphabet(String character) {
  final rxp = RegExp(r'[a-zA-Z]');
  return rxp.hasMatch(character);
}

String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}

String formatDateTime(DateTime dateTime,String locale) {
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
    return DateFormat.EEEE(locale)
        .format(dateTime); // 曜日を日本語で表示
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
