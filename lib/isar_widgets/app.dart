import 'package:dict_app/isar_widgets/bottom_shell_widget.dart';
import 'package:dict_app/isar_widgets/file_details_view/file_details_view.dart';
import 'package:dict_app/isar_widgets/home.dart';
import 'package:dict_app/isar_widgets/sub_items_view.dart';
import 'package:dict_app/isar_widgets/utils/sheet_page.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_duration_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_position_provider.dart';
import 'package:dict_app/providers/audio_player_provider/player_state_provider.dart';
import 'package:dict_app/providers/audio_player_provider/start_end_provider.dart';
import 'package:dict_app/providers/isar_database_provider/isar_provider.dart';
import 'package:dict_app/providers/translation_helper_provider/translation_helper_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// Future<void> main() async {
//   runApp(const ProviderScope(child: IsarFolderStructureApp()));
// }

final navigatorKey = GlobalKey<NavigatorState>();

enum PathParamerterKeys {
  parentId,
  fileId;

  int? getCurrentValue() {
    return GoRouter.of(navigatorKey.currentContext!)
        .state
        .currentParameterValue(name);
  }
}

class IsarFolderStructureApp extends StatelessWidget {
  const IsarFolderStructureApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _router =
        GoRouter(navigatorKey: navigatorKey, initialLocation: '/', routes: [
      ShellRoute(
          builder: (context, state, child) {
            return Stack(
              children: [
                child,
                Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        SafeArea(child: BottomShellWidget(state: state)))
              ],
            );
          },
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) =>
                  const _EagerInitialization(child: Home()),
            ),
            GoRoute(
              path: '/sub-items/:${PathParamerterKeys.parentId.name}',
              builder: (context, state) {
                final parentId =
                    state.pathParameters[PathParamerterKeys.parentId.name];
                return SubItemsView(parentId: int.tryParse(parentId!));
              },
            ),
            GoRoute(
                path: '/file-details/:${PathParamerterKeys.fileId.name}',
                builder: (context, state) {
                  final id = int.tryParse(
                      state.pathParameters[PathParamerterKeys.fileId.name]!);
                  if (id == null) {
                    return const CupertinoPageScaffold(
                        child: Center(
                      child: CupertinoActivityIndicator(),
                    ));
                  }
                  return FileDetailsView(id: id);
                },
                routes: [
                ])
          ])
    ]);
    return CupertinoApp.router(
      routerConfig: _router,
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.watch(isarProvider);
    final translator = ref.watch(translationHelperProvider);

    if (![isar.value,translator.value].contains(null)) {
      return child;
    } else {
      return PlatformScaffold(
        body: Center(
          child: Center(
            child: PlatformCircularProgressIndicator(),
          ),
        ),
      );
    }
  }
}

extension GoRouterStateEx on GoRouterState {
  int? currentParameterValue(String key) {
    final value = pathParameters[key];
    return value != null ? int.tryParse(value) : null;
  }
}
