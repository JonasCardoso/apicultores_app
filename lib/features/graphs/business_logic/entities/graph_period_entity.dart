import 'package:apicultores_app/features/graphs/data/dtos/graph_period_dto.dart';
import 'package:equatable/equatable.dart';

class GraphPeriodEntity extends Equatable {
  final DateTime startDate;
  final DateTime? endDate;

  const GraphPeriodEntity({
    required this.startDate,
    this.endDate,
  });

  GraphPeriodDTO toDTO() {
    return GraphPeriodDTO(
      startDate: startDate,
      endDate: endDate,
    );
  }

  bool get isValid {
    return startDate.isBefore(endDate ?? DateTime.now());
  }

  bool get canBeCollected {
    final difference = (endDate ?? DateTime.now()).difference(startDate);
    return difference.inDays <= 365;
  }

  GraphPeriodEntity copyWith({
    DateTime? startDate,
    DateTime? Function()? setEndDate,
  }) {
    return GraphPeriodEntity(
        startDate: startDate ?? this.startDate,
        endDate: setEndDate != null ? setEndDate() : endDate);
  }

  factory GraphPeriodEntity.fromDTO(GraphPeriodDTO dto) {
    return GraphPeriodEntity(
      startDate: dto.startDate,
      endDate: dto.endDate,
    );
  }

  @override
  List<Object?> get props => [
        startDate,
        endDate,
      ];
}
