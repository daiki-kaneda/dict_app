import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class FileSettingView extends StatelessWidget {
  const FileSettingView(this.fileId, {super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(),
      body: Center(
        child: Text('settings'),
      ),
    );
  }
}

class ShowFileSettingsButton extends StatelessWidget {
  const ShowFileSettingsButton(this.fileId,{super.key});

  final int fileId;

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      onPressed: () => context.pushNamed('settings', pathParameters: {'fileId': fileId.toString()}),
      icon: Icon(PlatformIcons(context).settings),
    );
  }
}
