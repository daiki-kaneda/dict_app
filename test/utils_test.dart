import 'package:dict_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Title List Builders', () {
    final now = DateTime(2025, 3, 26, 15, 0, 0); // 固定日時
    const locale = 'en_US';

    test('past24hoursTitleList generates correct titles', () {
      final titles = past24hoursTitleList(now, locale: locale);
      final expected = List.generate(24, (i) {
        return DateFormat.H(locale)
            .format(DateTime(2025, 3, 26, 23, 59, 59).subtract(Duration(hours: i)));
      }).reversed.toList();
      expect(titles, expected);
    });

    test('pastWeekTitleList generates correct titles', () {
      final titles = pastWeekTitleList(now, locale: locale);
      final expected = List.generate(7, (i) {
        return DateFormat.E(locale)
            .format(DateTime(2025, 3, 26, 23, 59, 59).subtract(Duration(days: i)));
      }).reversed.toList();
      expect(titles, expected);
    });

    test('pastMonthTitleList generates correct titles', () {
      final titles = pastMonthTitleList(now, locale: locale);
      final expected = List.generate(31, (i) {
        return DateFormat.d(locale)
            .format(DateTime(2025, 3, 26, 23, 59, 59).subtract(Duration(days: i)));
      }).reversed.toList();
      expect(titles, expected);
    });

    test('past6MonthsTitleList generates correct titles', () {
      final titles = past6MonthsTitleList(now, locale: locale);
      final expected = List.generate(6, (i) {
        return DateFormat.MMM(locale)
            .format(DateTime(2025, 3 - i, 1));
      }).reversed.toList();
      expect(titles, expected);
    });

    test('pastYearTitleList generates correct titles', () {
      final titles = pastYearTitleList(now, locale: locale);
      final expected = List.generate(12, (i) {
        return DateFormat.M(locale)
            .format(DateTime(2025, 3 - i, 1));
      }).reversed.toList();
      expect(titles, expected);
    });
  });
}
