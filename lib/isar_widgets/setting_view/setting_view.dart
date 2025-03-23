import 'dart:io';

import 'package:dict_app/isar_widgets/app.dart';
import 'package:dict_app/isar_widgets/utils/platform_picker.dart';
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
            hasLeading: false,
            header: const Text('使用言語'),
            children: [
              PlatformLanguagePicker(
                  initialLanguage: setting.languageCode,
                  onLanguageChanged: (code) {
                    ref
                        .read(settingNotifierProvider.notifier)
                        .updateSetting(languageCode: code);
                  }),
            ],
          ),
          if (isDictOrListening)
            CupertinoListSection(
              hasLeading: false,
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
              ],
            ),
          if (!isDictOrListening)
            CupertinoListSection(
                header: const Text("PDF設定"),
                hasLeading: false,
                children: [
                  PlatformListTile(
                    title: Text('翻訳をつける'),
                    trailing: PlatformSwitch(
                        value: setting.appendTranslation,
                        onChanged: (value) {
                          ref
                              .read(settingNotifierProvider.notifier)
                              .updateSetting(appendTranslation: value);
                        }),
                  ),
                  PlatformListTile(
                    title: Text('答えをつける'),
                    trailing: PlatformSwitch(
                        value: setting.appendAnswer,
                        onChanged: (value) {
                          ref
                              .read(settingNotifierProvider.notifier)
                              .updateSetting(appendAnswer: value);
                        }),
                  ),
                  PlatformListTile(
                    title: Text('ワードをカッコで分ける'),
                    trailing: PlatformSwitch(
                        value: setting.separateWordsWithParentheses,
                        onChanged: (value) {
                          ref
                              .read(settingNotifierProvider.notifier)
                              .updateSetting(
                                  separateWordsWithParentheses: value);
                        }),
                  ),
                  PlatformListTile(
                    title: Text('アンダーラインをつなげる'),
                    trailing: PlatformSwitch(
                        value: setting.connectUnderlinedParts,
                        onChanged: (value) {
                          ref
                              .read(settingNotifierProvider.notifier)
                              .updateSetting(connectUnderlinedParts: value);
                        }),
                  ),
                  PlatformListTile(
                    title: Text('アンダーラインを表示する'),
                    trailing: PlatformSwitch(
                        value: setting.showUnderlinedParts,
                        onChanged: (value) {
                          ref
                              .read(settingNotifierProvider.notifier)
                              .updateSetting(showUnderlinedParts: value);
                        }),
                  ),
                  PlatformListTile(
                    title: Text('ページ番号をつける'),
                    trailing: PlatformSwitch(
                        value: setting.showPageNumbers,
                        onChanged: (value) {
                          ref
                              .read(settingNotifierProvider.notifier)
                              .updateSetting(showPageNumbers: value);
                        }),
                  ),
                  PlatformListTile(
                    title: Text('アルファベットのみを隠す'),
                    trailing: PlatformSwitch(
                        value: setting.hideOnlyAlphabet,
                        onChanged: (value) {
                          ref
                              .read(settingNotifierProvider.notifier)
                              .updateSetting(hideOnlyAlphabet: value);
                        }),
                  ),
                ]),
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
