import 'dart:io';

import 'package:dict_app/models/data_tree_isar/item.dart';
import 'package:dict_app/providers/isar_database_provider/sub_items_provider.dart';
import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/trailing_button/select_folder_list.dart/expansion_tile/custom_expansion_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectFolderList extends ConsumerWidget {
  const SelectFolderList({
    super.key,
    required this.sourceId,
  });

  final int sourceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final root = ref.watch(subItemsProviderProvider(null).select((rootAsync) {
      return rootAsync.when(
          data: (tree) {
            return tree;
          },
          error: (_, __) => null,
          loading: () => null);
    }));
    if (root != null) {
      return ListView(
        children: [
          // SelectTargetFolderListTile(root,sourceId)
          for (final subF in root.whereType<Folder>())
            SelectTargetFolderListTile(subF, sourceId)
        ],
      );
    } else {
      return Center(
        child: PlatformCircularProgressIndicator(),
      );
    }
  }
}

class SelectTargetFolderListTile extends ConsumerWidget {
  const SelectTargetFolderListTile(this.folder, this.sourceId, {super.key});

  final Folder folder;

  final int sourceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(expansionNotifierProvider(folder.id.toString()).notifier);

    final subFolders =
        ref.watch(subItemsProviderProvider(folder.id).select((subFolderAsync) {
      return subFolderAsync.when(
          data: (tree) {
            return tree.whereType<Folder>();
          },
          error: (_, __) => null,
          loading: () => null);
    }));

    final enabled = sourceId != folder.id;

    void onTapTile() {
      Navigator.of(context).pop(folder.id);
    }

    if (subFolders == null) return Container();

    final icon = PlatformIcons(context).folder;

    if (subFolders.isEmpty == true) {
      return PlatformListTile(
        leading: Icon(
          PlatformIcons(context).folder,
          color: CupertinoTheme.of(context).textTheme.textStyle.color,
        ),
        title: Text(folder.title),
        onTap: enabled ? onTapTile : null,
      );
    } else {
      return AnimatedCustomExpansionTile(
          enabled: enabled,
          id: folder.id.toString(),
          leading: Icon(
            icon,
          ),
          title: Text(folder.title),
          trailing: PlatformIconButton(
              onPressed: () {
                ref
                    .read(expansionNotifierProvider(folder.id.toString())
                        .notifier)
                    .toggle();
              },
              icon: Icon(Platform.isIOS
                  ? CupertinoIcons.chevron_down
                  : Icons.expand_more)),
          onTap: onTapTile,
          child: Column(
            // if souceId match folder.id,not show descendants
            children: enabled
                ? subFolders
                    .map((f) => Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: SelectTargetFolderListTile(f, sourceId),
                        ))
                    .toList()
                : [],
          ));
    }
  }
}

Future<int?> getNewFolderId(BuildContext context, int sourceId) async {
  return showPlatformModalSheet<int?>(
    context: context,
    builder: (context) {
      return PlatformScaffold(
        appBar: PlatformAppBar(
          leading: PlatformTextButton(
            onPressed:()=>Navigator.of(context).pop(),
            child: Text('キャンセル'),
          ),
          title: Text('フォルダ選択'),
        ),
        body: SelectFolderList(
        sourceId: sourceId,
      ),
      );
    },
  );
}
