import 'dart:io';

import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/isar_widgets/bottom_shell_widget.dart';
import 'package:dict_app/isar_widgets/store_ui/store_sheet.dart';
import 'package:dict_app/isar_widgets/utils/custom_paints/progress_ring.dart';
import 'package:dict_app/isar_widgets/utils/platform_action_sheet.dart';
import 'package:dict_app/isar_widgets/utils/platform_dialog.dart';
import 'package:dict_app/isar_widgets/utils/platform_text_form.dart';
import 'package:dict_app/isar_widgets/utils/select_folder_list.dart';
import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/folder_provider.dart';
import 'package:dict_app/providers/isar_database_provider/sub_items_provider.dart';
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
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(parentFolder?.title ?? ''),
          trailing: ShowStoreSheetButton(),
        ),
        child: SubItemsList(parentId: parentId));
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

    Future<void> prepareFileToOpen(File file) async {
      print('file title:${file.title}');
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
                    const SliverFillRemaining(
                      child: Center(
                        child: Text("Let's make first folder or file!"),
                      ),
                    )
                ],
              );
            } else {
              // final parentFolder = ref.watch(folderProvider(parentId!));
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
                            prepareFileToOpen(file);
                          },
                        );
                      },
                      itemCount: items.length,
                    ),
                  if (items.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                        child: Text('No items in this folder(id:$parentId)'),
                      ),
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
            subtitle: Text('id: ${folder.id}'),
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
          assert(file.id!=null);

          final parentId = PathParamerterKeys.parentId.getCurrentValue();
          return PlatformListTile(
            leading: CompletionRing(file.id!),
            title: Text(
              file.title.toString(),
            ),
            subtitle: Text('id: ${file.id}'),
            // subtitle: Text(formatDateTime(file.lastUpdatedAt)),
            onTap: () {
              if (parentId == null) return;
              context.push('/file-details/${file.id}');
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
                    ActionSheetAction('名称変更', onTap: () async {
                      final String? newTitle = await showPlatformDialog(
                        context: context,
                        builder: (context) {
                          return PlatformTextFieldDialog(
                            title: 'New folder name',
                          );
                        },
                      );
                      if (newTitle == null) return;
                      notifier.updateFolder(id, newTitle);
                    }),
                    ActionSheetAction('移動', onTap: () async {
                      final int? newParentId =
                          await getNewFolderId(context, id);
                      if (newParentId == null) return;
                      notifier.moveFolder(id, newParentId);
                      // rebuild SubItemsView(newParentId)
                      ref.invalidate(subItemsProviderProvider(newParentId));
                    }),
                    ActionSheetAction('削除', onTap: () async {
                      final confirm = await showConfirmDialog(context,
                          title: 'フォルダを削除',
                          description:
                              '${folder.title}を削除してもよろしいですか？一度削除すると復元はできません。');
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
                    ActionSheetAction('名称変更', onTap: () async {
                      final String? newTitle = await showPlatformDialog(
                        context: context,
                        builder: (context) {
                          return PlatformTextFieldDialog(
                            title: 'New file name',
                          );
                        },
                      );

                      if (newTitle == null) return;
                      notifier.updateFile(id, newTitle);
                    }),
                    ActionSheetAction('移動', onTap: () async {
                      final int? newParentId =
                          await getNewFolderId(context, id, isFileMoving: true);
                      if (newParentId == null) return;
                      notifier.moveFile(id, newParentId);
                      // rebuild SubItemsView(newParentId)
                      ref.invalidate(subItemsProviderProvider(newParentId));
                    }),
                    ActionSheetAction('削除', onTap: () async {
                      final confirm = await showConfirmDialog(context,
                          title: 'ファイルを削除',
                          description:
                              '${file.title}を削除してもよろしいですか？一度削除すると復元はできません。');
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
  const CompletionRing(this.fileId, {super.key,this.alphabetOnly=true});

  final int fileId;
  final bool alphabetOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completionRate = ref.watch(completionRateProvider(fileId,alphabetOnly: alphabetOnly));
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
