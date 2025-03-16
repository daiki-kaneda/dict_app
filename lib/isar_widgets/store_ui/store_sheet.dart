import 'dart:io';

import 'package:dict_app/providers/iap_provider/iap_repository_provider.dart';
import 'package:dict_app/providers/iap_provider/localized_price_provider.dart';
import 'package:dict_app/providers/iap_provider/packages_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:purchases_flutter/object_wrappers.dart';
import 'package:badges/badges.dart' as badges;

class StoreSheet extends ConsumerWidget {
  const StoreSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packages = ref.watch(packagesProvider('tickets')).value ?? [];

    return PlatformScaffold(
        backgroundColor:
            Platform.isIOS ? CupertinoColors.systemGroupedBackground : null,
        appBar: PlatformAppBar(
          cupertino: (context, platform) => CupertinoNavigationBarData(
              backgroundColor:
                  CupertinoColors.systemGroupedBackground.resolveFrom(context)),
        ),
        body: ListView(
          children: [
            CurrentTicketsSection(), 
            if(packages.isNotEmpty)
            PurchaseTicketsSection(packages)
            ],
        ));
  }
}

class CurrentTicketsSection extends StatelessWidget {
  const CurrentTicketsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      children: [CurrentTicketsTile()],
    );
  }
}

class CurrentTicketsTile extends ConsumerWidget {
  const CurrentTicketsTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? numTicketsRemaining = ref.watch(settingNotifierProvider.select(
        (a) => a.when(
            data: (s) => s.remainingTickets,
            error: (_, __) => null,
            loading: () => null)));
    return CupertinoListTile.notched(
      leading: TicketIcon(),
      title: Text('残りのチケット枚数:'),
      trailing: numTicketsRemaining != null
          ? Text(numTicketsRemaining.toString())
          : PlatformCircularProgressIndicator(),
    );
  }
}

class PurchaseTicketsSection extends StatelessWidget {
  const PurchaseTicketsSection(this.packages, {super.key});

  final List<Package> packages;

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      header: Text('チケット購入'),
      children: [for (final p in packages) PackageTile(package: p)],
    );
  }
}

class PackageTile extends ConsumerWidget {
  const PackageTile({super.key, required this.package});

  final Package package;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = package.storeProduct;
    return PlatformListTile(
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(product.title),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: LocalizedPriceWidget(product.identifier),
          )
        ],
      ),
      trailing: PlatformTextButton(
        onPressed: () {
          ref.read(iapNotifierProvider.notifier).purchasePackage(package);
        },
        child: Text('購入'),
      ),
    );
  }
}

class LocalizedPriceWidget extends ConsumerWidget {
  const LocalizedPriceWidget(
    this.id, {
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizedPrice = ref.watch(localizedPriceProvider(id));
    if (localizedPrice.hasValue) {
      return Text(localizedPrice.value ?? '');
    } else {
      return PlatformCircularProgressIndicator();
    }
  }
}

class ShowStoreSheetButton extends ConsumerWidget {
  const ShowStoreSheetButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformIconButton(
      onPressed: () async {
        context.pushNamed('store');
      },
      icon: TicketIconWithRemainings(),
    );
  }
}

class TicketIconWithRemainings extends ConsumerWidget {
  const TicketIconWithRemainings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? numTicketsRemaining = ref.watch(settingNotifierProvider.select(
        (a) => a.when(
            data: (s) => s.remainingTickets,
            error: (_, __) => null,
            loading: () => null)));

    return badges.Badge(
      badgeAnimation: badges.BadgeAnimation.fade(),
      badgeStyle: badges.BadgeStyle(
          padding: EdgeInsets.all(5),
          elevation: 0,
          badgeColor: Platform.isIOS
              ? CupertinoColors.systemBlue.resolveFrom(context)
              : Colors.blue),
      badgeContent: numTicketsRemaining != null
          ? Text(
              numTicketsRemaining.toString(),
              style: TextStyle(
                  color: Platform.isIOS ? CupertinoColors.white : Colors.white),
            )
          : Container(),
      child: TicketIcon(),
    );
  }
}

class TicketIcon extends StatelessWidget {
  const TicketIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Platform.isIOS ? CupertinoIcons.ticket : Icons.local_activity);
  }
}
