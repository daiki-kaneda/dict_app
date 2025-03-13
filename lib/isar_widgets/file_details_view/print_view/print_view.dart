import 'package:flutter/cupertino.dart';

class PrintView extends StatelessWidget {
  const PrintView(this.fileId,{super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
        return Center(
      child: Text('Print'),
    );
  }
}