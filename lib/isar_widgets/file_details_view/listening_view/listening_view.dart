import 'package:flutter/cupertino.dart';

class ListeningView extends StatelessWidget {
  const ListeningView(this.fileId,{super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
        return ListView(
          children: List.generate(100, (i)=>Text('You listen!')),
        );
  }
}