import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graph_period_dto.g.dart';

@JsonSerializable()
class GraphPeriodDTO extends Equatable {
  final DateTime startDate;
  final DateTime? endDate;

  const GraphPeriodDTO({
    required this.startDate,
    this.endDate,
  });

  factory GraphPeriodDTO.fromJson(Map<String, dynamic> json) =>
      _$GraphPeriodDTOFromJson(json);

  @override
  List<Object?> get props => [
        startDate,
        endDate,
      ];
}
