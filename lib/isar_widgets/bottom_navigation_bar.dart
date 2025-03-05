import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/providers/isar_database_provider/sub_items_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ShareBottomNavigationBar extends StatelessWidget {
  const ShareBottomNavigationBar({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final fullPath = state.fullPath;
    if (fullPath == '/') {
      return const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.transparent,
        leading: CreateFolderButton(),
      );
    } else if (fullPath == '/sub-items/:parentId') {
      return const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.transparent,
        leading: CreateFolderButton(),
        trailing: CreateFileButton(),
      );
    } else {
      return Container();
    }
  }
}

class CreateFolderButton extends ConsumerWidget {
  const CreateFolderButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformIconButton(
      onPressed: () {
        final parentId =
            GoRouter.of(navigatorKey.currentContext!).state.currentParentId();
        ref
            .read(subItemsProviderProvider(parentId).notifier)
            .createFolder(title: 'new folder');
      },
      icon: const Icon(CupertinoIcons.folder_badge_plus),
    );
  }
}

class CreateFileButton extends ConsumerWidget {
  const CreateFileButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformIconButton(
      onPressed: () {
        final parentId =
            GoRouter.of(navigatorKey.currentContext!).state.currentParentId();
        ref
            .read(subItemsProviderProvider(parentId).notifier)
            .createFileFromLocalAudio(title: 'new file');
      },
      icon: const Icon(CupertinoIcons.plus),
    );
  }
}

extension GoRouterStateEx on GoRouterState {
  int? currentParentId() {
    final parentId = pathParameters['parentId'];
    return parentId != null ? int.tryParse(parentId) : null;
  }
}
