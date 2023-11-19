import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_with_ip_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graph_properties_dto.g.dart';

@JsonSerializable()
class GraphPropertiesDTO extends Equatable {
  final BeeDeviceWithIpDTO device;
  final int startDate;

  const GraphPropertiesDTO({
    required this.device,
    required this.startDate,
  });

  factory GraphPropertiesDTO.fromJson(Map<String, dynamic> json) =>
      _$GraphPropertiesDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GraphPropertiesDTOToJson(this);

  @override
  List<Object?> get props => [
        device,
        startDate,
      ];
}
