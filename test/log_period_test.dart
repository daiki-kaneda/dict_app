import 'package:dict_app/providers/logs_provider/logs_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LogPeriod.containsDate', () {
    test('Today\'s date is included in the today period', () {
      final logPeriod = LogPeriod.today();
      final today = DateTime.now();
      expect(logPeriod.containsDate(today), isTrue);
    });

    test('Yesterday\'s date is not included in the today period', () {
      final logPeriod = LogPeriod.today();
      final yesterday = DateTime.now().subtract(Duration(days: 1));
      expect(logPeriod.containsDate(yesterday), isFalse);
    });

    test('Included in the past week period', () {
      final logPeriod = LogPeriod.pastWeek();
      final fourDaysAgo = DateTime.now().subtract(Duration(days: 4));
      expect(logPeriod.containsDate(fourDaysAgo), isTrue);
    });

    test('Not included in the past week period', () {
      final logPeriod = LogPeriod.pastWeek();
      final eightDaysAgo = DateTime.now().subtract(Duration(days: 8));
      expect(logPeriod.containsDate(eightDaysAgo), isFalse);
    });

    test('Included in the custom period', () {
      final startDate = DateTime(2024, 1, 1);
      final endDate = DateTime(2024, 1, 10);
      final logPeriod = LogPeriod.custom(startDate: startDate, endDate: endDate);
      final checkDate = DateTime(2024, 1, 5);
      expect(logPeriod.containsDate(checkDate), isTrue);
    });

    test('Not included in the custom period (before)', () {
      final startDate = DateTime(2024, 1, 1);
      final endDate = DateTime(2024, 1, 10);
      final logPeriod = LogPeriod.custom(startDate: startDate, endDate: endDate);
      final checkDate = DateTime(2023, 12, 31);
      expect(logPeriod.containsDate(checkDate), isFalse);
    });

    test('Not included in the custom period (after)', () {
      final startDate = DateTime(2024, 1, 1);
      final endDate = DateTime(2024, 1, 10);
      final logPeriod = LogPeriod.custom(startDate: startDate, endDate: endDate);
      final checkDate = DateTime(2024, 1, 11);
      expect(logPeriod.containsDate(checkDate), isFalse);
    });
  });
}

