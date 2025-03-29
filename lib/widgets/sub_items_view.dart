import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dict_app/widgets/app.dart';
import 'package:dict_app/widgets/bottom_shell_widget.dart';
import 'package:dict_app/widgets/store_ui/store_sheet.dart';
import 'package:dict_app/widgets/utils/custom_paints/progress_ring.dart';
import 'package:dict_app/widgets/utils/platform_action_sheet.dart';
import 'package:dict_app/widgets/utils/platform_dialog.dart';
import 'package:dict_app/widgets/utils/platform_text_form.dart';
import 'package:dict_app/widgets/utils/select_folder_list.dart';
import 'package:dict_app/models/data_tree/item.dart';
import 'package:dict_app/providers/datatree_provider/file_details_provider.dart';
import 'package:dict_app/providers/datatree_provider/folder_provider.dart';
import 'package:dict_app/providers/datatree_provider/sub_items_provider.dart';
import 'package:dict_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SubItemsView extends ConsumerWidget {
  const SubItemsView({super.key, this.parentId});

  final int? parentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final parentFolder = ref.watch(folderProvider(parentId!));
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(parentFolder?.title ?? ''),
          trailingActions: [InSessionIndicator(), ShowStoreSheetButton()],
        ),
        body: SubItemsList(parentId: parentId));
  }
}

class SubItemsList extends ConsumerWidget {
  const SubItemsList({super.key, required this.parentId});

  final int? parentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subItems = ref.watch(subItemsProviderProvider(parentId));

    if (!subItems.hasValue) return Container();
    final items = subItems.value!;

    Future<void> onFileOpen(File file) async {
      // just update 'lastUpdatedAt'
      ref
          .read(subItemsProviderProvider(parentId).notifier)
          .updateFile(file.id!);
      print('file title:${file.title}');
    }

    Future<void> onFolderOpen(Folder folder) async {
      // just update 'lastUpdatedAt'
      ref
          .read(subItemsProviderProvider(parentId).notifier)
          .updateFolder(folder.id!);
      print('folder title:${folder.title}');
    }

    return SafeArea(
        child: Column(
      children: [
        Expanded(child: Builder(
          builder: (context) {
            if (parentId == null) {
              return CustomScrollView(
                slivers: [
                  // const CupertinoSliverNavigationBar(
                  //   largeTitle: Text('フォルダ'),
                  // ),
                  if (items.isNotEmpty)
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        return ItemTile(item: items[index]);
                      },
                      itemCount: items.length,
                    ),
                  if (items.isEmpty)
                    SliverFillRemaining(
                      child: Center(child: NoItemText()),
                    )
                ],
              );
            } else {
              return CustomScrollView(
                slivers: [
                  // CupertinoSliverNavigationBar(
                  //   largeTitle: Text(parentFolder?.folderName ?? ''),
                  // ),
                  if (items.isNotEmpty)
                    SliverList.builder(
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return ItemTile(
                          item: item,
                          onFileTapped: () {
                            final file = (item as File);
                            onFileOpen(file);
                          },
                          onFolderTapped: () {
                            final folder = (item as Folder);
                            onFolderOpen(folder);
                          },
                        );
                      },
                      itemCount: items.length,
                    ),
                  if (items.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                          child: NoItemText(
                        isHome: false,
                      )),
                    )
                ],
              );
            }
          },
        )),
        BottomShellWidgetPlaceHolder()
      ],
    ));
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile(
      {super.key, required this.item, this.onFolderTapped, this.onFileTapped});

  final Item item;
  final void Function()? onFolderTapped;
  final void Function()? onFileTapped;

  @override
  Widget build(BuildContext context) {
    switch (item) {
      case Folder():
        {
          final folder = (item as Folder);
          return PlatformListTile(
            leading: const Icon(CupertinoIcons.folder),
            title: Text(
              folder.title.toString(),
            ),
            // subtitle: Text('id: ${folder.id}'),
            onTap: () {
              context.push('/sub-items/${folder.id.toString()}');
              if (onFolderTapped != null) onFolderTapped!();
            },
            trailing: ActionButton(item),
          );
        }
      case File():
        {
          final file = (item as File);
          assert(file.id != null);
          final fileId = file.id!;

          final parentId = PathParamerterKeys.parentId.getCurrentValue();
          return PlatformListTile(
            leading: CompletionRing(fileId),
            title: Text(
              file.title.toString(),
            ),
            subtitle: LastFileUpdatedAtText(
              fileId,
              parentId: file.parentId,
            ),
            onTap: () {
              if (parentId == null) return;
              context.push('/file-details/$fileId');
              if (onFileTapped != null) onFileTapped!();
            },
            trailing: ActionButton(item),
          );
        }
    }
  }
}

class ActionButton extends ConsumerWidget {
  const ActionButton(this.item, {super.key});

  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformIconButton(
      icon: Icon(Icons.adaptive.more_rounded),
      onPressed: () {
        final parentId = PathParamerterKeys.parentId.getCurrentValue();
        final notifier = ref.read(subItemsProviderProvider(parentId).notifier);
        switch (item) {
          case Folder():
            {
              final folder = item as Folder;
              final id = folder.id;
              if (id == null) return;
              showCustomActionSheet(
                  title: folder.title,
                  isCupertino: true,
                  context: context,
                  actions: [
                    ActionSheetAction(l10n().rename, onTap: () async {
                      final String? newTitle = await showPlatformDialog(
                        context: context,
                        builder: (context) {
                          return PlatformTextFieldDialog(
                            initialValue: folder.title,
                            title: l10n().newFolderName,
                          );
                        },
                      );
                      if (newTitle == null) return;
                      notifier.updateFolder(id, newTitle: newTitle);
                    }),
                    ActionSheetAction(l10n().move, onTap: () async {
                      final int? newParentId =
                          await getNewFolderId(context, id);
                      if (newParentId == null) return;
                      notifier.moveFolder(id, newParentId);
                      // rebuild SubItemsView(newParentId)
                      ref.invalidate(subItemsProviderProvider(newParentId));
                    }),
                    ActionSheetAction(l10n().delete, onTap: () async {
                      final confirm = await showConfirmDialog(context,
                          title: l10n().confirmDeleteDialogTitle,
                          description:
                              l10n().confirmDeleteDialogContent(folder.title));
                      if (confirm == true) notifier.deleteFolder(id);
                    })
                  ]);
            }
          case File():
            {
              final file = item as File;
              final id = file.id;
              if (id == null) return;
              showCustomActionSheet(
                  title: file.title,
                  isCupertino: true,
                  context: context,
                  actions: [
                    ActionSheetAction(l10n().rename, onTap: () async {
                      final String? newTitle = await showPlatformDialog(
                        context: context,
                        builder: (context) {
                          return PlatformTextFieldDialog(
                            initialValue: file.title,
                            title: l10n().newFileName,
                          );
                        },
                      );

                      if (newTitle == null) return;
                      notifier.updateFile(id, title: newTitle);
                    }),
                    ActionSheetAction(l10n().move, onTap: () async {
                      final int? newParentId =
                          await getNewFolderId(context, id, isFileMoving: true);
                      if (newParentId == null) return;
                      notifier.moveFile(id, newParentId);
                      // rebuild SubItemsView(newParentId)
                      ref.invalidate(subItemsProviderProvider(newParentId));
                    }),
                    ActionSheetAction(l10n().delete, onTap: () async {
                      final confirm = await showConfirmDialog(context,
                          title: l10n().confirmDeleteDialogTitle,
                          description:
                              l10n().confirmDeleteDialogContent(file.title));
                      if (confirm == true) notifier.deleteFile(id);
                    })
                  ]);
            }
        }
      },
    );
  }
}

class CompletionRing extends ConsumerWidget {
  const CompletionRing(this.fileId, {super.key, this.alphabetOnly = true});

  final int fileId;
  final bool alphabetOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completionRate =
        ref.watch(completionRateProvider(fileId, alphabetOnly: alphabetOnly));
    final bool isCupertino = Platform.isIOS;
    final Color backgroundColor = isCupertino
        ? CupertinoColors.systemFill.resolveFrom(context)
        : Colors.grey[300]!;
    final Color progressColor = isCupertino
        ? CupertinoColors.systemCyan.resolveFrom(context)
        : Colors.cyan;
    final Color completionColor = isCupertino
        ? CupertinoColors.systemGreen.resolveFrom(context)
        : Colors.green;

    return ProgressRingStatic(
      progress: completionRate,
      backgroundColor: backgroundColor,
      progressColor: progressColor,
      completionColor: completionColor,
    );
  }
}

class LastFileUpdatedAtText extends ConsumerWidget {
  const LastFileUpdatedAtText(this.fileId, {super.key, this.parentId});

  final int? parentId;
  final int fileId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastUpdatedAtFuture = ref.watch(SubItemsProviderProvider(parentId)
        .selectAsync((subs) => subs
            .whereType<File>()
            .firstWhereOrNull((f) => f.id == fileId)
            ?.lastUpdatedAt));

    return FutureBuilder(
      future: lastUpdatedAtFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(formatDateTime(
              snapshot.data!, platformLocaleName()));
        } else {
          return Container();
        }
      },
    );
  }
}

class InSessionIndicator extends ConsumerWidget {
  const InSessionIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inSession = ref.watch(inSessionProvider);
    return AnimatedOpacity(
        opacity: inSession ? 1.0 : 0.0,
        duration: Duration(milliseconds: 200),
        child: PlatformCircularProgressIndicator());
  }
}

class NoItemText extends StatelessWidget {
  const NoItemText({super.key, this.isHome = true});

  final bool isHome;

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    final fontSize = isTablet(context) ? 32.0 : 18.0;
    if (isIOS) {
      return isHome
          ? Text.rich(iconDescriptionTextSpan(
              context,
              icon: CupertinoIcons.folder_badge_plus,
              fontSize: fontSize,
              description: l10n().createNewFolder,
            ))
          : Text.rich(
              TextSpan(children: [
                iconDescriptionTextSpan(
                  context,
                  icon: CupertinoIcons.folder_badge_plus,
                  fontSize: fontSize,
                  description: l10n().createNewFolder,
                ),
                TextSpan(text: '\n\n'),
                iconDescriptionTextSpan(
                  context,
                  icon: CupertinoIcons.plus,
                  fontSize: fontSize,
                  description: l10n().createNewDictation,
                )
              ]),
              textAlign: TextAlign.center,
            );
    } else {
      return Container();
    }
  }
}
