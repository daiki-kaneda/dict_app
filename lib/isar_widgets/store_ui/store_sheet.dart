import 'dart:io';

import 'package:dict_app/providers/iap_provider/iap_repository_provider.dart';
import 'package:dict_app/providers/iap_provider/localized_price_provider.dart';
import 'package:dict_app/providers/iap_provider/packages_provider.dart';
import 'package:dict_app/providers/local_database_provider/setting_provider/setting_provider.dart';
import 'package:dict_app/widgets/folder_structure_widget/folder_view/tree_list_tile/trailing_button/select_folder_list.dart/expansion_tile/custom_expansion_tile.dart';
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
            if (packages.isNotEmpty) PurchaseTicketsSection(packages),
            QAndASection()
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
      badgeAnimation:
          badges.BadgeAnimation.fade(animationDuration: Duration.zero),
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

const List<(String, String)> qa = [
  ('一回に消費されるチケットの枚数は？', '一枚のみです。'),
  ('解析するオーディオの長さの上限はある？', 'はい。オーディオの上限は一回120秒までです。'),
  (
    '解析データやチケットのバックアップはとる？',
    'いいえ。アプリを削除したり、機種変更などをすると、解析データおよびチケットなどのすべてのデータは削除され、復元できません。'
  ),
  ('一度消費したチケットを元に戻せる？', 'いいえ。一度使用したチケットは復元することはできません。'),
  ('解析データは商用利用可能？', 'はい。解析データはラインセンスの記載なしに商用利用を含めて自由に使用可能です。'),
];

class QAndASection extends StatelessWidget {
  const QAndASection({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
        header: Text('Q&A'),
        children: qa.indexed.map((t) {
          final id = t.$1.toString();
          final question = t.$2.$1;
          final answer = t.$2.$2;
          return QAndATile(id, question: question, answer: answer);
        }).toList());
  }
}

class QAndATile extends StatelessWidget {
  const QAndATile(this.id,
      {super.key, required this.question, required this.answer});

  final String id;
  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return AnimatedCustomExpansionTile(
        id: id, 
        title: Text(question), 
        child: Text(answer));
  }
}
