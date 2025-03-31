import 'package:dict_app/providers/connectivity_provider/connectivity_provider.dart';
import 'package:dict_app/providers/logs_provider/logs_provider.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:dict_app/widgets/bottom_shell_widget.dart';
import 'package:dict_app/widgets/file_details_view/dictation_view/dictation_view.dart';
import 'package:dict_app/widgets/file_details_view/file_details_view.dart';
import 'package:dict_app/widgets/file_details_view/listening_view/listening_view.dart';
import 'package:dict_app/widgets/logs_view/logs_view.dart';
import 'package:dict_app/widgets/setting_view/setting_view.dart';
import 'package:dict_app/widgets/file_details_view/stats_view/stats_view.dart';
import 'package:dict_app/widgets/home.dart';
import 'package:dict_app/widgets/store_ui/store_sheet.dart';
import 'package:dict_app/widgets/sub_items_view.dart';
import 'package:dict_app/providers/iap_provider/iap_repository_provider.dart';
import 'package:dict_app/providers/datatree_provider/isar_provider.dart';
import 'package:dict_app/providers/local_database_provider/local_database_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:dict_app/providers/mlkit_translation_helper_provider/mlkit_translation_helper_provider.dart';
import 'package:dict_app/widgets/utils/loading_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              builder: (context, state) => const _EagerInitialization(
                  child: _BootstrapWrapper(child: Home())),
            ),
            GoRoute(
              path: '/sub-items/:$parentIdKey',
              builder: (context, state) {
                final parentId = state.currentParameterValue(parentIdKey);
                return SubItemsView(parentId: parentId!);
              },
            ),
            GoRoute(
              path: '/all-files',
              builder: (context, state) {
                return LoadingPage();
              },
            ),
            GoRoute(
              name: 'logs',
              path: '/logs',
              pageBuilder: (context, state) {
                return platformPage(
                    context: context,
                    fullscreenDialog: true,
                    child: LogsView());
              },
            ),
            GoRoute(
              name: 'store',
              path: '/store',
              pageBuilder: (context, state) {
                return platformPage(
                    context: context,
                    fullscreenDialog: true,
                    child: StoreSheet());
              },
            ),
            GoRoute(
                path: '/file-details/:$fileIdKey',
                builder: (context, state) {
                  final id = state.currentParameterValue(fileIdKey);
                  if (id == null) {
                    return LoadingPage();
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
                  GoRoute(
                    name: 'stats',
                    path: 'stats',
                    pageBuilder: (context, state) {
                      final fileId = state.currentParameterValue(fileIdKey)!;
                      return platformPage(
                          context: context,
                          child: StatsView(fileId),
                          fullscreenDialog: true);
                    },
                  ),
                ]),
            GoRoute(
                name: 'settings',
                path: '/settings',
                pageBuilder: (context, state) {
                  final isHome = state.extra as bool?;
                  return platformPage(
                      context: context,
                      child: SettingView(
                        isHome: isHome ?? false,
                      ),
                      fullscreenDialog: true);
                }),
          ])
    ]);
    return PlatformApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class _EagerInitialization extends ConsumerWidget {
  const _EagerInitialization({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isar = ref.watch(isarProvider);
    final translator = ref.watch(mlkitTranslationHelperProvider);
    final iap = ref.watch(iapNotifierProvider);
    final localDatabase = ref.watch(localDatabaseProvider);
    final connectivity = ref.watch(connectivityProvider);
    final setting = ref.watch(settingNotifierProvider);

    if (![
      isar.value,
      translator.value,
      iap.value,
      localDatabase.value,
      connectivity.value,
      setting.value,
    ].contains(null)) {
      ref.watch(logsProvider);
      return child;
    } else {
      return LoadingPage();
    }
  }
}

class _BootstrapWrapper extends ConsumerStatefulWidget {
  const _BootstrapWrapper({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __BootStrapState();
}

class __BootStrapState extends ConsumerState<_BootstrapWrapper> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(settingNotifierProvider.notifier).initialSetup();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

extension GoRouterStateEx on GoRouterState {
  int? currentParameterValue(String key) {
    final value = pathParameters[key];
    return value != null ? int.tryParse(value) : null;
  }
}
