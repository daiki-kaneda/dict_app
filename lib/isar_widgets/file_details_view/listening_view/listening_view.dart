import 'package:flutter/cupertino.dart';

class ListeningView extends StatelessWidget {
  const ListeningView(this.fileId,{super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
        return Center(
          child: Text('listening'),
        );
  }
}