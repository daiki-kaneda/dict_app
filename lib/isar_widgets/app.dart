import 'package:dict_app/isar_widgets/bottom_shell_widget.dart';
import 'package:dict_app/isar_widgets/file_details_view/dictation_view/dictation_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/file_details_view.dart';
import 'package:dict_app/isar_widgets/file_details_view/listening_view/listening_view.dart';
import 'package:dict_app/isar_widgets/home.dart';
import 'package:dict_app/isar_widgets/sub_items_view.dart';
import 'package:dict_app/providers/isar_database_provider/isar_provider.dart';
import 'package:dict_app/providers/translation_helper_provider/translation_helper_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final parentIdKey = PathParamerterKeys.parentId.name;
    final fileIdKey = PathParamerterKeys.fileId.name;
    final router =
        GoRouter(navigatorKey: navigatorKey, initialLocation: '/', routes: [
      ShellRoute(
          builder: (context, state, child) {
            return Stack(
              children: [
                child,
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SafeArea(child: BottomShellWidget(state: state)))
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
              path: '/sub-items/:$parentIdKey',
              builder: (context, state) {
                final parentId = state.currentParameterValue(parentIdKey);
                return SubItemsView(parentId: parentId!);
              },
            ),
            GoRoute(
                path: '/file-details/:$fileIdKey',
                builder: (context, state) {
                  final id = state.currentParameterValue(fileIdKey);
                  if (id == null) {
                    return const CupertinoPageScaffold(
                        child: Center(
                      child: CupertinoActivityIndicator(),
                    ));
                  }
                  return FileDetailsView(id: id);
                },
                routes: [
                  GoRoute(
                    name: 'dictation',
                    path: 'dictation',
                    pageBuilder: (context, state) {
                      final fileId = state.currentParameterValue(fileIdKey)!;
                      return platformPage(
                          context: context,
                          fullscreenDialog: true,
                          child: DictationProblemView(fileId));
                    },
                  ),
                  GoRoute(
                    name: 'listening',
                    path: 'listening',
                    pageBuilder: (context, state) {
                      final fileId = state.currentParameterValue(fileIdKey)!;
                      return platformPage(
                          context: context,
                          fullscreenDialog: true,
                          child: ListeningContentView(fileId));
                    },
                  ),
                ])
          ])
    ]);
    return CupertinoApp.router(
      routerConfig: router,
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.watch(isarProvider);
    final translator = ref.watch(translationHelperProvider);

    if (![isar.value, translator.value].contains(null)) {
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
