import 'package:flutter/cupertino.dart';

class SettingView extends StatelessWidget {
  const SettingView(this.fileId,{super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
        return Center(
      child: Text('setting'),
    );
  }
}