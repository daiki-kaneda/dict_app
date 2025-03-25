import 'package:dict_app/widgets/logs_view/logs_view.dart';
import 'package:dict_app/widgets/setting_view/setting_view.dart';
import 'package:dict_app/widgets/sub_items_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('フォルダ'),
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          ShowSettingViewButton(isHome: true,),
          ShowLogsViewButton()
        ],),
      ),
      body: SubItemsList(parentId: null)
      );
  }
}