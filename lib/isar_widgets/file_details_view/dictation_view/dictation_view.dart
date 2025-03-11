import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/dictation_page_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_page_view/input_text_field.dart';
import 'package:dict_app/isar_widgets/file_details_view/player_widget/player_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class DictationView extends StatelessWidget {
  const DictationView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlatformTextButton(
        onPressed: () {
          showCupertinoSheet(
            context: context,
            pageBuilder: (context) {
              return CupertinoPageScaffold(
                  navigationBar:
                      CupertinoNavigationBar(middle: Text('Dictation')),
                  child: 
                  Stack(
                    fit: StackFit.expand,
                    children: [
                      InputTextField(FocusNode()..requestFocus()),
                      SafeArea(
                        child: Column(
                          children: [
                            Expanded(child: DictationPageView(id: fileId)),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: PlayerWidget(),
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            },
          );
        },
        child: Text('start dictation'),
      ),
    );
  }
}
