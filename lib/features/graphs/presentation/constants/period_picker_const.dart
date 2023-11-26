import 'package:apicultores_app/features/graphs/business_logic/entities/graph_period_entity.dart';

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

  GraphPeriodEntity get graphPeriod {
    final now = DateTime.now();
    switch (this) {
      case PeriodData.lastWeek:
        return GraphPeriodEntity(
            startDate: now.subtract(const Duration(days: 7)));
      case PeriodData.lastMonth:
        return GraphPeriodEntity(
            startDate: now.subtract(const Duration(days: 30)));
      case PeriodData.lastSixMonths:
        return GraphPeriodEntity(
            startDate: now.subtract(const Duration(days: 180)));
      case PeriodData.lastYear:
        return GraphPeriodEntity(
            startDate: now.subtract(const Duration(days: 365)));
    }
  }
}
