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

  DateTime startDuration(DateTime date) {
    late DateTime startDate;
    switch (this) {
      case TimeScaleType.hour:
        startDate = DateTime(date.year, date.month, date.day, date.hour);
      case TimeScaleType.day:
        startDate = DateTime(date.year, date.month, date.day);
      case TimeScaleType.week:
        startDate = DateTime(date.year, date.month, date.day)
            .subtract(const Duration(days: 7));
      case TimeScaleType.month:
        startDate = DateTime(date.year, date.month);
      case TimeScaleType.year:
        startDate = DateTime(date.year);
    }
    return startDate == date ? startDate.subtract(durationScale) : startDate;
  }
}
