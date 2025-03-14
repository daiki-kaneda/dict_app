import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListeningView extends ConsumerWidget {
  const ListeningView(this.fileId,{super.key});

  final int fileId;

  @override
  Widget build(BuildContext context,WidgetRef ref){
        return Center(
      child: Text('listening'),
    );
  }
}