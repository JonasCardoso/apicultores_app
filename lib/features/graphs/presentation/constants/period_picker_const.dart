enum PeriodData {
  lastWeek,
  lastMonth,
  lastSixMonths,
  lastYear,
}

extension PeriodInformation on PeriodData {
  String get text {
    switch (this) {
      case PeriodData.lastWeek:
        return 'Última semana';
      case PeriodData.lastMonth:
        return 'Último mês';
      case PeriodData.lastSixMonths:
        return 'Últimos 6 meses';
      case PeriodData.lastYear:
        return 'Último ano';
    }
  }

  DateTime get date {
    final now = DateTime.now();
    switch (this) {
      case PeriodData.lastWeek:
        return now.subtract(const Duration(days: 7));
      case PeriodData.lastMonth:
        return now.subtract(const Duration(days: 30));
      case PeriodData.lastSixMonths:
        return now.subtract(const Duration(days: 180));
      case PeriodData.lastYear:
        return now.subtract(const Duration(days: 365));
    }
  }
}
