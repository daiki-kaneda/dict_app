import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, this.backgroundColor});

  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        backgroundColor: backgroundColor,
        body: Center(child: PlatformCircularProgressIndicator()));
  }
}