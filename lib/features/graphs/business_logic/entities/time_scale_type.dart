enum TimeScaleType { hour, day, week, month, year }

extension TimeScaleTypeInfo on TimeScaleType {
  String get iconName {
    switch (this) {
      case TimeScaleType.hour:
        return 'H';
      case TimeScaleType.day:
        return 'D';
      case TimeScaleType.week:
        return 'S';
      case TimeScaleType.month:
        return 'M';

      case TimeScaleType.year:
        return 'A';
    }
  }

  Duration get durationScale {
    switch (this) {
      case TimeScaleType.hour:
        return const Duration(hours: 1);
      case TimeScaleType.day:
        return const Duration(days: 1);
      case TimeScaleType.week:
        return const Duration(days: 7);
      case TimeScaleType.month:
        return const Duration(days: 30);
      case TimeScaleType.year:
        return const Duration(days: 365);
    }
  }

  DateTime startDuration(DateTime now) {
    switch (this) {
      case TimeScaleType.hour:
        return DateTime(now.year, now.month, now.day, now.hour);
      case TimeScaleType.day:
        return DateTime(now.year, now.month, now.day);
      case TimeScaleType.week:
        return DateTime(now.year, now.month, now.day);
      case TimeScaleType.month:
        return DateTime(now.year, now.month);
      case TimeScaleType.year:
        return DateTime(now.year);
    }
  }
}
