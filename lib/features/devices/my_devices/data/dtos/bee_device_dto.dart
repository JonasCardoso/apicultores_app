import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_frequency_of_saving_dto.dart';
import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_location_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bee_device_dto.g.dart';

@JsonSerializable()
class BeeDeviceDTO extends Equatable {
  final String id;
  final String name;
  final BeeDeviceLocationDTO location;
  final BeeDeviceFrequencyOfSavingDTO frequencyOfSavingData;

  const BeeDeviceDTO({
    required this.id,
    required this.name,
    required this.location,
    required this.frequencyOfSavingData,
  });

  factory BeeDeviceDTO.fromJson(Map<String, dynamic> json) =>
      _$BeeDeviceDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BeeDeviceDTOToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        frequencyOfSavingData,
      ];
}
