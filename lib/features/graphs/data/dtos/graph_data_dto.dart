import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graph_data_dto.g.dart';

@JsonSerializable()
class GraphDataDTO extends Equatable {
  final List<String?> timestamps;

  @JsonKey(name: 'internal_sound_readings')
  final List<String?> internalSoundReadings;

  @JsonKey(name: 'external_sound_readings')
  final List<String?> externalSoundReadings;

  @JsonKey(name: 'proximity_readings')
  final List<String?> proximityReadings;

  const GraphDataDTO({
    required this.timestamps,
    required this.internalSoundReadings,
    required this.externalSoundReadings,
    required this.proximityReadings,
  });

  factory GraphDataDTO.fromJson(Map<String, dynamic> json) =>
      _$GraphDataDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GraphDataDTOToJson(this);

  @override
  List<Object?> get props => [
        timestamps,
        internalSoundReadings,
        externalSoundReadings,
        proximityReadings,
      ];
}
