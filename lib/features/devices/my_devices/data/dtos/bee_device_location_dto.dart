import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bee_device_location_dto.g.dart';

@JsonSerializable()
class BeeDeviceLocationDTO extends Equatable {
  final double latitude;
  final double longitude;

  const BeeDeviceLocationDTO({
    required this.latitude,
    required this.longitude,
  });

  factory BeeDeviceLocationDTO.fromJson(Map<String, dynamic> json) =>
      _$BeeDeviceLocationDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BeeDeviceLocationDTOToJson(this);

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
