import 'dart:io';

import 'package:dict_app/utils/utils.dart';
import 'package:dict_app/widgets/app.dart';
import 'package:dict_app/widgets/utils/platform_bottom_navigation_bar.dart';
import 'package:dict_app/widgets/utils/platform_dialog.dart';
import 'package:dict_app/widgets/utils/platform_text_form.dart';
import 'package:dict_app/providers/datatree_provider/file_details_provider.dart';
import 'package:dict_app/providers/datatree_provider/sub_items_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomShellWidget extends StatelessWidget {
  const BottomShellWidget({super.key, required this.state});

  final GoRouterState state;

  @override
  Widget build(BuildContext context) {
    final fullPath = state.fullPath;
    if (fullPath == '/') {
      return const CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        border: Border(),
        backgroundColor: CupertinoColors.transparent,
        leading: CreateFolderButton(),
      );
    } else if (fullPath == '/sub-items/:${PathParamerterKeys.parentId.name}') {
      return const CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        border: Border(),
        backgroundColor: CupertinoColors.transparent,
        leading: CreateFolderButton(),
        trailing: CreateFileButton(),
      );
    } else if (fullPath == '/file-details/:${PathParamerterKeys.fileId.name}') {
      final fileId = int.tryParse(
          state.pathParameters[PathParamerterKeys.fileId.name] ?? '');
      if (fileId == null) throw Exception('No fileId:int in pathparameters');
      return BottomNavigationWidget(fileId);
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
      onPressed: () async {
        final parentId = PathParamerterKeys.parentId.getCurrentValue();
        final String? title = await showPlatformDialog(
          context: context,
          builder: (context) {
            return PlatformTextFieldDialog(
              title: l10n().folderName,
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
        final inSessionNotifier = ref.read(inSessionProvider().notifier);
        try {
          final parentId = PathParamerterKeys.parentId.getCurrentValue();
          final String? title = await showPlatformDialog(
            context: context,
            builder: (context) {
              return PlatformTextFieldDialog(
                title: l10n().fileName,
              );
            },
          );
          if (title == null) return;
          if (!(await ref
              .read(settingNotifierProvider.notifier)
              .hasTickets())) {
            final openStore = await showConfirmDialog(
              navigatorKey.currentContext!,
              title: l10n().insufficientTicketsDialogTitle,
              description: l10n().insufficientTicketsDialogContent
            );
            if (openStore == true)navigatorKey.currentContext?.pushNamed('store');
            return;
          }
          inSessionNotifier.sessionStart();
          await ref
              .read(subItemsProviderProvider(parentId).notifier)
              .createFileFromLocalAudio(title: title);
          inSessionNotifier.sessionEnd();
        } catch (e) {
          print(e);
          inSessionNotifier.sessionEnd();
        }
      },
      icon: const Icon(CupertinoIcons.plus),
    );
  }
}

class BottomNavigationWidget extends ConsumerWidget {
  const BottomNavigationWidget(this.fileId, {super.key});

  final int fileId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentTabIndexProvider);
    return PlatformBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) =>
            ref.read(currentTabIndexProvider.notifier).updateIndex(newIndex),
        items: [
          BottomNavigationBarItem(
              icon: Icon(PlatformIcons(context).pen), label: 'Dictation'),
          BottomNavigationBarItem(
              icon: Icon(PlatformIcons(context).volumeUp), label: 'Listening'),
          BottomNavigationBarItem(
              icon: Icon(Platform.isIOS ? CupertinoIcons.printer : Icons.print),
              label: 'Print'),
        ]);
  }
}

class BottomShellWidgetPlaceHolder extends StatelessWidget {
  const BottomShellWidgetPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0,
        child: BottomShellWidget(state: GoRouter.of(context).state));
  }
}
