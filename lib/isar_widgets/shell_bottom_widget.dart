import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/isar_widgets/utils/platform_text_form.dart';
import 'package:dict_app/providers/isar_database_provider/sub_items_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ShellBottomWidget extends StatelessWidget {
  const ShellBottomWidget({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final fullPath = state.fullPath;
    if (fullPath == '/') {
      return const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.transparent,
        leading: CreateFolderButton(),
      );
    } else if (fullPath == '/sub-items/:${PathParamerterKeys.parentId.name}') {
      return const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.transparent,
        leading: CreateFolderButton(),
        trailing: CreateFileButton(),
      );
    } else {
      return Container();
      //return BottomNavigationBarWidget();
    }
  }
}

class CreateFolderButton extends ConsumerWidget {
  const CreateFolderButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformIconButton(
      onPressed: () async {
        final parentId = PathParamerterKeys.parentId.getCurrentValue();
        final String? title = await showPlatformDialog(
          context: context,
          builder: (context) {
            return PlatformTextFieldDialog(
              title: 'Folder name',
            );
          },
        );
        if (title == null) return;
        ref
            .read(subItemsProviderProvider(parentId).notifier)
            .createFolder(title: title);
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
      onPressed: () async {
        final parentId = PathParamerterKeys.parentId.getCurrentValue();
        final String? title = await showPlatformDialog(
          context: context,
          builder: (context) {
            return PlatformTextFieldDialog(
              title: 'File name',
            );
          },
        );
        if (title == null) return;
        ref
            .read(subItemsProviderProvider(parentId).notifier)
            .createFileFromLocalAudio(title: title);
      },
      icon: const Icon(CupertinoIcons.plus),
    );
  }
}

class BottomNavigationBarWidget extends ConsumerWidget {
  const BottomNavigationBarWidget({super.key});

  void _onTap(BuildContext context, int index) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoTabBar(
        currentIndex: 0,
        onTap: (index) => _onTap(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ]);
  }
}
