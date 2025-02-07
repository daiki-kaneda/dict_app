import 'package:dict_app/providers/utility%20_provider/utility_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomNavigatorObserver extends NavigatorObserver{
  CustomNavigatorObserver(this.ref);

  final ProviderRef ref;

  @override
  void didPush(Route route, Route? previousRoute) {
    print(ref.read(currentTreeIdNotifierProvider).);
    super.didPush(route, previousRoute);
  }
}