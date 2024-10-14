import 'package:file_picker/file_picker.dart';

bool isAlphabet(String character){
  final rxp = RegExp(r'[a-zA-Z]');
  return rxp.hasMatch(character);
}

String formatDuration(Duration duration) {
  final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}


final int maxSizeMbs = 10;

bool validateAudioSize(int size,int maxMbs){
  return maxMbs > (size/(1024*1024));
}