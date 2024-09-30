import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:file_picker/file_picker.dart';

part 'file_picker_provider.g.dart';

@riverpod
class FilerPickerNotifier extends _$FilerPickerNotifier {
  @override
  FilePicker build() {
    return FilePicker.platform;
  }

  Future<(String path,Uint8List bytes)?> getAudioData()async{
    final result = await state.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
        allowedExtensions: [
          'mp3',
          'aac'
          'wav',
          'flac',
          'ogg',
        ]
    );

    if(result!=null&&result.paths.whereType<String>().isNotEmpty&&result.xFiles.isNotEmpty){
      return (result.paths.first!,await result.xFiles.first.readAsBytes());
    }
    return null;
  }
}