import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/isar_widgets/bottom_navigation_bar.dart';
import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:dict_app/providers/audio_player_provider/audio_player_provider.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/isar_database_provider/folder_provider.dart';
import 'package:dict_app/providers/isar_database_provider/sub_items_provider.dart';
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

    return SafeArea(child: Builder(
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
                        final audioPath = (item as File).audioPath;
                        ref
                            .read(audioPlayerNotifierProvider.notifier)
                            .setSource(audioPath);
                        print('audioPath set :$audioPath');
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
              });
        }
      case File():
        {
          final file = (item as File);
          final parentId = PathParamerterKeys.parentId.getCurrentValue();
          return PlatformListTile(
              leading: const Icon(CupertinoIcons.doc),
              title: Text(
                file.title.toString(),
              ),
              subtitle: Text('id: ${file.id}'),
              onTap: () {
                if (parentId == null) return;
                context.push('/file-details/${file.id}');
                if (onFileTapped != null) onFileTapped!();
              });
        }
    }
  }
}
