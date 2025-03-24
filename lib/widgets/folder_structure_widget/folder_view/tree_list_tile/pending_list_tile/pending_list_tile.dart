import 'package:dict_app/my_dict/models/pending_dict_data.dart';
import 'package:dict_app/my_dict/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingListTile extends ConsumerWidget {
  const PendingListTile(this.data,{super.key});

  final PendingDictData data;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return FutureBuilder(
      future: data.loadDict, 
      builder:(context, snapshot) {
        final isErrored = snapshot.hasError && snapshot.connectionState != ConnectionState.waiting;
        final isWaiting = snapshot.connectionState==ConnectionState.waiting;

         if(!isErrored&&snapshot.connectionState==ConnectionState.done){
          return const SizedBox();
        }

        return PlatformListTile(
          title: Text(data.title,style: const TextStyle(fontWeight: FontWeight.w800),),
          subtitle: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(formatDateTime(data.createdAt,'ja'),
          style: TextStyle(
            color: Colors.grey.shade700
          ),),
        ],
      ),
          trailing: Stack(
            children: [
              if(isWaiting)
              PlatformCircularProgressIndicator(),
              if(isErrored)
              CupertinoButton(
                onPressed: (){
                  // ref.read(pendingAudioListProvider.notifier)
                  // .retryAddAudio(data.id);
                }, 
                child: const Icon(
                  CupertinoIcons.arrow_clockwise,
                  color: CupertinoColors.activeBlue,))
            ],
          ) ,
        );
      },);

  }
}