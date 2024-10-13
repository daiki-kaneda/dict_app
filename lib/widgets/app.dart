
import 'package:dict_app/constants/inner_navigator_key.dart';
import 'package:dict_app/constants/scaffold_key.dart';
import 'package:dict_app/providers/app_documents_directory_provider/app_documents_directory_provider.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_completion_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/dict_view_provider/dict_view_provider.dart';
import 'package:dict_app/providers/local_database_provider/data_tree_provider/data_tree_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_structure_widget.dart';
import 'package:dict_app/widgets/fotter_button/footer_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoTree = ref.watch(dataTreeNotifierProvider);
    final isDictShowing = ref.watch(isDictShowingProvider);
    final isSheetShowing = ref.watch(isSheetShowingProvider);
    return _EagerInitialization(
      CupertinoApp(
      theme: const CupertinoThemeData(
        //brightness: Brightness.light, // ライトモードを指定
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
          persistentFooterButtons:(!isSheetShowing && isDictShowing.value==false) ? const [
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
  const _EagerInitialization(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(dataTreeNotifierProvider);
    ref.read(appDocumentsDirectoryNotifierProvider);
    ref.watch(currentTreeIdNotifierProvider);
    ref.watch(isDictShowingProvider);
    ref.watch(isEditingNotifierProvider);
    ref.watch(selectedIdsProvider);
    ref.watch(canPopProvider);
    ref.watch(isSheetShowingProvider);
    ref.watch(inputTextFieldFocusNodeProvider);
    ref.watch(typedTextNotifierProvider);
    ref.watch(audioPlayerNotifierProvider);
    ref.watch(startEndProviderProvider);
    ref.watch(playerCompletionProvider);
    ref.watch(playerDurationProvider);
    ref.watch(playerPositionProvider);
    ref.watch(playerStateProvider);
    
    ref.watch(wordIndexNotifierProvider);
    ref.watch(sentenceIndexNotifierProvider);
    ref.watch(paragraphIndexNotifierProvider);
    return child;
  }
}