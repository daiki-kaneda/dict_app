import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class PlatformListSection extends StatelessWidget {
  final List<Widget> children;
  final Widget? header;
  final Widget? footer;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final BoxDecoration? decoration;
  final Clip clipBehavior;
  final EdgeInsetsGeometry? dividerMargin;
  final double? additionalDividerMargin;
  final double? topMargin;
  final bool hasLeading;
  final Color? separatorColor;

  const PlatformListSection({
    super.key,
    required this.children,
    this.header,
    this.footer,
    this.margin,
    this.backgroundColor = CupertinoColors.systemGroupedBackground,
    this.decoration,
    this.clipBehavior = Clip.hardEdge,
    this.dividerMargin,
    this.additionalDividerMargin,
    this.topMargin,
    this.hasLeading = true,
    this.separatorColor,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoListSection.insetGrouped(
        header: header,
        footer: footer,
        margin: margin ?? EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        backgroundColor: backgroundColor ?? CupertinoColors.systemGroupedBackground,
        decoration: decoration,
        clipBehavior: clipBehavior,
        // dividerMargin: ,
        additionalDividerMargin: additionalDividerMargin,
        topMargin: topMargin,
        separatorColor: separatorColor,
        children: children,
      );
    } else {
      return Container(
        margin: margin ?? EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: decoration ??
            BoxDecoration(
              color: backgroundColor ?? Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
        clipBehavior: clipBehavior,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (header != null)
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.headlineSmall ?? TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  child: header!,
                ),
              ),
            Column(
              children: [
                for (int i = 0; i < children.length; i++) ...[
                  children[i],
                  if (i < children.length - 1)
                    Divider(
                      color: separatorColor ?? Theme.of(context).dividerColor,
                      indent: dividerMargin?.horizontal ?? 16.0,
                      endIndent: dividerMargin?.horizontal ?? 16.0,
                    ),
                ],
              ],
            ),
            if (footer != null)
              Padding(
                padding: EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodySmall ?? TextStyle(fontSize: 14, color: Colors.grey),
                  child: footer!,
                ),
              ),
          ],
        ),
      );
    }
  }
}
