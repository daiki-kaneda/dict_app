import 'package:flutter_test/flutter_test.dart';
import 'package:dict_app/providers/logs_provider/logs_provider.dart';

void main() {
  late DateTime now;

  setUp(() {
    now = DateTime(2025, 3, 26);
  });

  group('LogPeriodType.range', () {
    test('Today range', () {
      final logPeriod = LogPeriodType.today;
      final range = logPeriod.range(now);
      expect(range.startDate, DateTime(2025, 3, 26));
      expect(range.endDate, DateTime(2025, 3, 26, 23, 59, 59));
    });

    test('Past week range', () {
      final logPeriod = LogPeriodType.thisWeek;
      final range = logPeriod.range(now);
      expect(range.startDate, DateTime(2025, 3, 20));
      expect(range.endDate, DateTime(2025, 3, 26, 23, 59, 59));
    });

    test('Past month range', () {
      final logPeriod = LogPeriodType.thisMonth;
      final range = logPeriod.range(now);
      expect(range.startDate, DateTime(2025, 3, 1));
      expect(range.endDate, DateTime(2025, 3, 31, 23, 59, 59));
    });

    test('Past six months range', () {
      final logPeriod = LogPeriodType.lastSixMonths;
      final range = logPeriod.range(now);
      expect(range.startDate, DateTime(2024, 10, 1)); 
      expect(range.endDate, DateTime(2025, 3, 31, 23, 59, 59));
    });

    test('Past year range', () {
      final logPeriod = LogPeriodType.lastYear;
      final range = logPeriod.range(now);
      expect(range.startDate, DateTime(2024, 4, 1)); 
      expect(range.endDate, DateTime(2025, 3, 31, 23, 59, 59)); 
    });
  });
}

