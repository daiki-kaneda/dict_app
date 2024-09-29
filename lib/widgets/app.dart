import 'dart:developer';

import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_structure_widget.dart';
import 'package:dict_app/widgets/fotter_button/footer_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tree_data_model/tree_data_model.dart';

final innerNavigatorKey = GlobalKey<NavigatorState>();
final rootNavigatorKey = GlobalKey<NavigatorState>();
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoTree = ref.watch(dataTreeNotifierProvider);
    final isTaskShowing = ref.watch(isDictShowingProvider);
    final IsSheetShowing = ref.watch(isSheetShowingProvider);
    return _EagerInitialization(
      CupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.light, // ライトモードを指定
      ),
      builder: (context, child) {
        if(todoTree.hasValue){
          return Scaffold(
          body: Navigator(
            key: innerNavigatorKey,
            onGenerateRoute: (settings) {
              return CupertinoPageRoute(
                builder: (context) {
                  return FolderStructureWidget(todoTree.value!.id);
                },
              );
            },
          ),
          persistentFooterButtons:!IsSheetShowing ? const [
             FooterButton()
          ]:null,
        );
        }else{
          return const Scaffold(
            body: CupertinoPageScaffold(child: 
            Center(
              child: CupertinoActivityIndicator(),
            ),)
          );
        }
      },
    )
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization(this.child,{super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dataTreeNotifierProvider);
    ref.watch(currentTreeIdNotifierProvider);
    ref.watch(isDictShowingProvider);
    ref.watch(isEditingNotifierProvider);
    ref.watch(selectedIdsProvider);
    ref.watch(canPopProvider);
    ref.watch(isSheetShowingProvider);
    return child;
  }
}