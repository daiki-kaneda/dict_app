// import 'package:dict_app/models/data_tree/dict_data/dict_data_model/dictation_data_model.dart';
// import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
// import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_sentence_widget.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class DictParagraphWidget extends ConsumerWidget {
//   const DictParagraphWidget(this.focusNode,{super.key});

  

//   final FocusNode focusNode;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final paragraph = ref.watch(selectedParagraphProvider);
//     if(paragraph.value==null){
//       return Center(
//         child: CupertinoActivityIndicator(),
//       );
//     }

//     return ListView.builder(
//       itemBuilder:(context, index) {
//         final sentence = paragraph.value!.sentences.elementAtOrNull(index);
//         if(sentence==null) return null;
//         return DictSentenceWidget(focusNode);
//       },);
//   }
// }