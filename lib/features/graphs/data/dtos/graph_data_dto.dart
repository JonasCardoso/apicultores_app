import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graph_data_dto.g.dart';

@JsonSerializable()
class GraphDataDTO extends Equatable {
  final List<String?> timestamps;

  @JsonKey(name: 'internal_sound')
  final List<String?> internalSound;

  @JsonKey(name: 'external_sound')
  final List<String?> externalSound;

  final List<String?> proximity;

  const GraphDataDTO({
    required this.timestamps,
    required this.internalSound,
    required this.externalSound,
    required this.proximity,
  });

  factory GraphDataDTO.fromJson(Map<String, dynamic> json) {
    print(json);
    return _$GraphDataDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GraphDataDTOToJson(this);

  @override
  List<Object?> get props => [
        timestamps,
        internalSound,
        externalSound,
        proximity,
      ];
}
