import 'package:dict_app/providers/navigator_observer_provider/custom_navigator_observer.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigator_observer_provider.g.dart';

@riverpod
NavigatorObserver customNavigatorObserver(CustomNavigatorObserverRef ref) {
  return CustomNavigatorObserver(ref);
}
