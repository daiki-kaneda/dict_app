import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomNavigatorObserver extends NavigatorObserver{
  CustomNavigatorObserver(this.ref);

  final ProviderRef ref;

}