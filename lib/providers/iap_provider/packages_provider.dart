import 'package:dict_app/providers/iap_provider/iap_repository_provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'packages_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<Package>> packages(PackagesRef ref, String identifier) async {
  final packages =
      await ref.read(iapNotifierProvider.notifier).getPackages(identifier);
  return packages;
}
