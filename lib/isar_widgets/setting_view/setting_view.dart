import 'dart:io';

import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/providers/isar_database_provider/file_details_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingView extends ConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setting = ref.watch(settingNotifierProvider).value;
    final notifier = ref.read(settingNotifierProvider.notifier);
    final isDictOrListening =
        ref.read(currentTabIndexProvider.select((i) => i == 0 || i == 1));

    final backgroundColor = Platform.isIOS
        ? CupertinoColors.systemGroupedBackground.resolveFrom(context)
        : null;
    if (setting == null) {
      return LoadingPage(backgroundColor: backgroundColor);
    }

    return PlatformScaffold(
      backgroundColor: backgroundColor,
      appBar: PlatformAppBar(
        cupertino: (context, platform) =>
            CupertinoNavigationBarData(backgroundColor: backgroundColor),
        title: Text("Settings"),
      ),
      body: ListView(
        children: [
          CupertinoListSection(
            header: const Text("一般"),
            children: [
              CupertinoListTile(
                title: const Text("翻訳を表示"),
                trailing: CupertinoSwitch(
                  value: setting.showTranslation,
                  onChanged: (value) {
                    notifier.updateSetting(
                        showTranslation: !setting.showTranslation);
                  },
                ),
              ),
              // CupertinoListTile(
              //     title: const Text("翻訳先の言語"),
              //     subtitle: Text(setting.translationTarget),
              //     onTap: () {}),
            ],
          ),
          if(!isDictOrListening)
          CupertinoListSection(
            header: const Text("PDF設定"),
            children: [
              CupertinoListTile(
                title: const Text("答えを追加"),
                trailing: CupertinoSwitch(
                  value: setting.appendAnswer,
                  onChanged: (value) {
                    notifier.updateSetting(appendAnswer: value);
                  },
                ),
              ),
              CupertinoListTile(
                title: const Text("ページナンバーの表示"),
                trailing: CupertinoSwitch(
                  value: setting.showPageNumbers,
                  onChanged: (value) {
                    notifier.updateSetting(showPageNumbers: value);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShowSettingViewButton extends StatelessWidget {
  const ShowSettingViewButton(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      onPressed: () => context.pushNamed('settings'),
      icon: Icon(PlatformIcons(context).settings),
    );
  }
}
