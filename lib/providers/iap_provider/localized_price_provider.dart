import 'package:dict_app/providers/iap_provider/iap_status.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localized_price_provider.g.dart';

@Riverpod(keepAlive: true)
FutureOr<String?> localizedPrice(
    LocalizedPriceRef ref, String productId) async {
  final products = await Purchases.getProducts([productId]);
  print('products:' + products.firstOrNull.toString());
  return products.firstOrNull?.priceString;
}
