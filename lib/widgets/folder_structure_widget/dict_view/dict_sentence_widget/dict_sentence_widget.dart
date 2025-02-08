import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/dict_view/dict_sentence_widget/dict_word_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictSentenceWidget extends ConsumerWidget {
  const DictSentenceWidget(this.focusNode,{super.key});



  final FocusNode focusNode;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sentence = ref.watch(selectedSentenceProvider);
    if(sentence.value==null){
      return Center(
        child: PlatformCircularProgressIndicator(),
      );
    }
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child:Wrap(
              spacing: 10,
              children: sentence.value!.words.asMap().entries.map((e)=>DictWordWidget(e.key,  focusNode)).toList()
            ) 
        );
  }
}
