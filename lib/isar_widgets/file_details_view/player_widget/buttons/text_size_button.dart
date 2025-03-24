import 'package:dict_app/isar_widgets/utils/platform_counter_dialog.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextSizeButton extends ConsumerWidget {
  const TextSizeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textSize =
        ref.watch(settingNotifierProvider.selectAsync((s) => s.textSize));

    return FutureBuilder(
      future: textSize,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PlatformTextButton(
              onPressed: () async {
                final newSize = await showPlatformCounterDialog(
                  context, 
                  initialValue: snapshot.data!,
                  titleBuilder:(_,__)=> Text('フォントサイズ')
                  );
                if (newSize != null) {
                  ref
                      .read(settingNotifierProvider.notifier)
                      .updateSetting(textSize: newSize);
                  print(newSize);
                }
              },
              child: Text(snapshot.data!.toString()));
        } else {
          return Container();
        }
      },
    );
  }
}

class DefaultTextSizeWrapper extends ConsumerWidget {
  const DefaultTextSizeWrapper(this.child,{super.key,required this.style});

  final Widget child;
  final TextStyle style;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textSize =
        ref.watch(settingNotifierProvider.selectAsync((s) => s.textSize));
    return FutureBuilder(
      future: textSize,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DefaultTextStyle(
            style: style.copyWith(
              fontSize: snapshot.data!.toDouble()
            ), child: child);
        } else {
          return Container();
        }
      },
    );
  }
}