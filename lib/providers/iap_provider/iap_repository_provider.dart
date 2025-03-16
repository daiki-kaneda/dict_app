import 'dart:io';

import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'iap_repository_provider.g.dart';

@riverpod
class IapNotifier extends _$IapNotifier {
  @override
  Future<bool> build() async {
    await _initPlatformState();
    // await restorePurchases();
    // addCustomerInfoUpdateListener();
    return true;
  }

  Future<void> _initPlatformState() async {
    await Purchases.setLogLevel(LogLevel.debug);

    PurchasesConfiguration configuration;
    if (Platform.isAndroid) {
      configuration =
          PurchasesConfiguration('goog_ZydHVZxktKaefTnZjfHDrEfPbbZ');
    } else {
      configuration =
          PurchasesConfiguration('appl_QbexHZgxwGjVYhVeIqMXqjIMNco');
    }
    await Purchases.configure(configuration);
  }

  Future<Offerings> _getOfferings() async {
    return Purchases.getOfferings();
  }

  Future<List<Package>> getPackages(String identifier) async {
    try {
      final offerings = await _getOfferings();
      return offerings.getOffering(identifier)?.availablePackages ?? [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> purchasePackage(Package package) async {
    try {
      final CustomerInfo info = await Purchases.purchasePackage(package);
      print(info.toJson());
    } catch (e) {
      print(e);
    }
  }

  // void addCustomerInfoUpdateListener() {
  //   Purchases.addCustomerInfoUpdateListener(
  //       (info) => _onPurchaseUpdate(info, _purchasedOrRestored));
  // }

  // Future<void> _onPurchaseUpdate(
  //     CustomerInfo info,
  //     Map<EntitlementStatus, ({Function active, Function inactive})>
  //         purchasedOrRestored) async {
  //   final entitlements = info.entitlements.all;
  //   for (final status in EntitlementStatus.values) {
  //     if (entitlements[status.id]?.isActive == true) {
  //       print('$status:isActive:true');
  //       purchasedOrRestored[status]!.active();
  //     } else {
  //       print('$status:isActive: not true');
  //       purchasedOrRestored[status]!.inactive();
  //     }
  //   }
  // }

  // Map<EntitlementStatus, ({Function active, Function inactive})>
  //     get _purchasedOrRestored => {
  //           EntitlementStatus.premium: (
  //             active: () {
  //               ref
  //                   .read(subscriptionStatusNotiferProvider.notifier)
  //                   .updatePlan(SubscriptionStatus.premium);
  //             },
  //             inactive: () {
  //               ref
  //                   .read(subscriptionStatusNotiferProvider.notifier)
  //                   .updatePlan(SubscriptionStatus.none);
  //             }
  //           )
  //         };

  // Future<void> _purchasePackage(Package package) async {
  //   try {
  //     CustomerInfo customerInfo = await Purchases.purchasePackage(package);
  //     _onPurchaseUpdate(customerInfo, _purchasedOrRestored);
  //   } on PlatformException catch (e) {
  //     var errorCode = PurchasesErrorHelper.getErrorCode(e);
  //     if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
  //       print('purchasePackage error: $e');
  //     }
  //   }
  // }

  // Future<void> _purchaseStoreProduct(StoreProduct product) async {
  //   try {
  //     CustomerInfo customerInfo = await Purchases.purchaseStoreProduct(product);
  //     _onPurchaseUpdate(customerInfo, _purchasedOrRestored);
  //   } on PlatformException catch (e) {
  //     var errorCode = PurchasesErrorHelper.getErrorCode(e);
  //     if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
  //       print('purchaseStoreProduct error: $e');
  //     }
  //   }
  // }

  // Future<void> purchaseProductByProductId(String productId)async{
  //   final product = (await Purchases.getProducts(
  //     [productId]
  //     )).firstOrNull;
  //   if(product!=null)_purchaseStoreProduct(product);
  // }

  // Future<void> restorePurchases() async {
  //   try {
  //     CustomerInfo customerInfo = await Purchases.restorePurchases();
  //     _onPurchaseUpdate(customerInfo, _purchasedOrRestored);
  //   } on PlatformException catch (e) {
  //     print('restore error:$e');
  //   }
  // }

  // Future<void> checkSubscriptionStatus() async {
  //   try {
  //     CustomerInfo customerInfo = await Purchases.getCustomerInfo();
  //     _onPurchaseUpdate(customerInfo, _purchasedOrRestored);
  //   } on PlatformException catch (e) {
  //     print('Error fetching purchaser info:$e');
  //   }
  // }
}
