import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformLinearIndicator extends StatelessWidget {
  final double progress; 

  const PlatformLinearIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4),
      height: 4,
      decoration: BoxDecoration(
        color:isIOS ? CupertinoColors.systemGrey5.resolveFrom(context).resolveFrom(context):Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: progress.clamp(0.0, 1.0),
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color:isIOS ? CupertinoColors.label:Colors.grey[600], 
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedPlatformPageViewLinearIndicator extends AnimatedWidget{
  const AnimatedPlatformPageViewLinearIndicator(this.controller,{super.key,required this.pageLength}):super(listenable: controller);

  final int pageLength;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final page = controller.page;
    if(page==null)return Center(child: PlatformCircularProgressIndicator(),);
    return PlatformLinearIndicator(
      progress:pageLength!=1 ? controller.page!/(pageLength-1):page);
  }
}
