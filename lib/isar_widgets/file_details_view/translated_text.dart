import 'package:dict_app/providers/translation_helper_provider/translation_helper_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TranslatedText extends ConsumerWidget {
  const TranslatedText(this.source, {super.key});

  final String source;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translator = ref.read(translationHelperProvider).requireValue;
    return FutureBuilder(
      future: translator.translate(source),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!,
          style: TextStyle(fontWeight: FontWeight.w600),);
        } else {
          return Center(
            child: PlatformCircularProgressIndicator(),
          );
        }
      },
    );
  }
}