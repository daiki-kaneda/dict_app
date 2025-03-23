import 'dart:io';

import 'package:dict_app/utils/language_local.dart';
import 'package:flutter/cupertino.dart';

class PlatformPicker extends StatelessWidget {
  const PlatformPicker({
    super.key,
    required this.itemExtent,
    required this.onSelectedItemChanged,
    required this.children,
    this.scrollController,
    this.diameterRatio,
    this.perspective,
    this.offAxisFraction,
    this.useMagnifier,
    this.magnification,
  });

  final double itemExtent;
  final void Function(int)? onSelectedItemChanged;
  final List<Widget> children;
  final FixedExtentScrollController? scrollController;
  final double? diameterRatio;
  final double? perspective;
  final double? offAxisFraction;
  final bool? useMagnifier;
  final double? magnification;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPicker(
        itemExtent: itemExtent,
        onSelectedItemChanged: onSelectedItemChanged,
        scrollController: scrollController,
        diameterRatio: diameterRatio ?? 1.07, // CupertinoPicker のデフォルト値
        useMagnifier: useMagnifier ?? false, // CupertinoPicker のデフォルト値
        magnification: magnification ?? 1.0, // CupertinoPicker のデフォルト値
        children: children,
      );
    } else {
      return ListWheelScrollView(
        itemExtent: itemExtent,
        onSelectedItemChanged: onSelectedItemChanged,
        controller: scrollController,
        diameterRatio: diameterRatio ?? 2.0, // ListWheelScrollView のデフォルト値
        perspective: perspective ?? 0.003, // ListWheelScrollView のデフォルト値
        offAxisFraction: offAxisFraction ?? 0.0, // ListWheelScrollView のデフォルト値
        useMagnifier: useMagnifier ?? false, // ListWheelScrollView のデフォルト値
        magnification: magnification ?? 1.0, // ListWheelScrollView のデフォルト値
        children: children,
      );
    }
  }
}

class PlatformLanguagePicker extends StatefulWidget {
  final String? initialLanguage; // 初期選択言語 (ISOコード)
  final ValueChanged<String> onLanguageChanged; // 言語変更時のコールバック
  final double itemExtent;
  final double? diameterRatio;
  final double? perspective;
  final double? offAxisFraction;
  final bool? useMagnifier;
  final double? magnification;


  const PlatformLanguagePicker({
    super.key,
    this.initialLanguage,
    required this.onLanguageChanged,
    this.itemExtent = 50.0, // デフォルト値を設定
    this.diameterRatio,
    this.perspective,
    this.offAxisFraction,
    this.useMagnifier,
    this.magnification,
  });

  @override
  State<PlatformLanguagePicker> createState() => _PlatformLanguagePickerState();
}

class _PlatformLanguagePickerState extends State<PlatformLanguagePicker> {
  late FixedExtentScrollController _controller;
  late List<String> _languageCodes;
  int? _selectedIndex;


  @override
  void initState() {
    super.initState();
    _languageCodes = MainLanguageLocal().supportedLanguages; // LanguageLocalから取得
    _languageCodes.sort(); // アルファベット順にソート

    // 初期選択位置を設定
    _selectedIndex = widget.initialLanguage != null
        ? _languageCodes.indexOf(widget.initialLanguage!)
        : 0; // 初期言語がない場合は0番目
    if (_selectedIndex == -1) {
      _selectedIndex = 0; // initialLanguage が不正な値なら、0にする
    }

    _controller = FixedExtentScrollController(initialItem: _selectedIndex!);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Wheel Pickerの高さを指定（必要に応じて調整）
      child: PlatformPicker(
        itemExtent: widget.itemExtent,
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
          widget.onLanguageChanged(_languageCodes[index]);
        },
        scrollController: _controller,
        diameterRatio: widget.diameterRatio,
        perspective: widget.perspective,
        offAxisFraction: widget.offAxisFraction,
        useMagnifier: widget.useMagnifier,
        magnification: widget.magnification,
        children: _languageCodes.map((code) {
          final nativeName = MainLanguageLocal().getNativeName(code);
          return Center(
            child: Text(
              nativeName,
              style: TextStyle(fontSize: widget.itemExtent * 0.5), // フォントサイズ調整
            ),
          );
        }).toList(),
      ),
    );
  }
}
