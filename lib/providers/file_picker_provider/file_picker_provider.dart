import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:file_picker/file_picker.dart';

part 'file_picker_provider.g.dart';

@riverpod
class FilerPickerNotifier extends _$FilerPickerNotifier {
  @override
  FilePicker build() {
    return FilePicker.platform;;
  }

  // Future<Uint8List?> getAudioData()async{
  //   final result = await state.pickFiles(
  //     type: FileType.media,
  //     allowMultiple: false
  //   );

  //   if(result!=null&&result.xFiles.isNotEmpty){
  //     return await result.xFiles.first.readAsBytes();
  //   }
  // }
}