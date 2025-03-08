import 'package:flutter/cupertino.dart';

class CupertinoSheetPage<T> extends Page<T> {
  final WidgetBuilder builder;

  const CupertinoSheetPage({
    required this.builder,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return CupertinoSheetRoute(
      settings: this,
      builder: builder,
    );
  }
}