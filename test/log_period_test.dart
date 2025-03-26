import 'package:flutter_test/flutter_test.dart';
import 'package:dict_app/providers/logs_provider/logs_provider.dart';

void main() {
  late DateTime now;

  setUp(() {
    now = DateTime(2025, 3, 26); // テストの基準日を固定
  });

  group('LogPeriod.containsDate', () {
    test('Today\'s date is included in the today period', () {
      final logPeriod = LogPeriodType.today;
      expect(logPeriod.containsDate(now), isTrue);
    });

    test('Yesterday\'s date is not included in the today period', () {
      final logPeriod = LogPeriodType.today;
      final yesterday = now.subtract(Duration(days: 1));
      expect(logPeriod.containsDate(yesterday), isFalse);
    });

    test('Included in the past week period', () {
      final logPeriod = LogPeriodType.pastWeek;
      final fourDaysAgo = now.subtract(Duration(days: 4));
      expect(logPeriod.containsDate(fourDaysAgo), isTrue);
    });

    test('Not included in the past week period', () {
      final logPeriod = LogPeriodType.pastWeek;
      final eightDaysAgo = now.subtract(Duration(days: 8));
      expect(logPeriod.containsDate(eightDaysAgo), isFalse);
    });

    test('Included in the past month period', () {
      final logPeriod = LogPeriodType.pastMonth;
      final twentyDaysAgo = DateTime(now.year, now.month, now.day - 20);
      expect(logPeriod.containsDate(twentyDaysAgo), isTrue);
    });

    test('Not included in the past month period', () {
      final logPeriod = LogPeriodType.pastMonth;
      final twoMonthsAgo = DateTime(now.year, now.month - 2, now.day);
      expect(logPeriod.containsDate(twoMonthsAgo), isFalse);
    });

    test('Included in the past six months period', () {
      final logPeriod = LogPeriodType.pastSixMonths;
      final fiveMonthsAgo = DateTime(now.year, now.month - 5, now.day);
      expect(logPeriod.containsDate(fiveMonthsAgo), isTrue);
    });

    test('Not included in the past six months period', () {
      final logPeriod = LogPeriodType.pastSixMonths;
      final sevenMonthsAgo = DateTime(now.year, now.month - 7, now.day);
      expect(logPeriod.containsDate(sevenMonthsAgo), isFalse);
    });

    test('Included in the past year period', () {
      final logPeriod = LogPeriodType.pastYear;
      final elevenMonthsAgo = DateTime(now.year, now.month-11, now.day);
      expect(logPeriod.containsDate(elevenMonthsAgo), isTrue);
    });

    test('Not included in the past year period', () {
      final logPeriod = LogPeriodType.pastYear;
      final twoYearsAgo = DateTime(now.year - 2, now.month, now.day);
      expect(logPeriod.containsDate(twoYearsAgo), isFalse);
    });
  });
}

