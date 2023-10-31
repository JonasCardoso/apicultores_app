import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_frequency_saving_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_location_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_dto.dart';
import 'package:equatable/equatable.dart';

class BeeDeviceEntity extends Equatable {
  final String id;
  final String name;
  final BeeDeviceLocationEntity location;
  final BeeDeviceFrequencySavingEntity frequencyOfSavingData;
  final String deviceIp;

  const BeeDeviceEntity({
    required this.id,
    required this.name,
    required this.location,
    required this.frequencyOfSavingData,
    required this.deviceIp,
  });

  factory BeeDeviceEntity.fromDTO(
    BeeDeviceDTO beeDeviceDTO,
    String deviceIp,
  ) =>
      BeeDeviceEntity(
        id: beeDeviceDTO.id,
        name: beeDeviceDTO.name,
        location: BeeDeviceLocationEntity.fromDTO(beeDeviceDTO.location),
        frequencyOfSavingData: BeeDeviceFrequencySavingEntity.fromDTO(
          beeDeviceDTO.frequencyOfSavingData,
        ),
        deviceIp: deviceIp,
      );

  BeeDeviceDTO toDTO() => BeeDeviceDTO(
        id: id,
        name: name,
        location: location.toDTO(),
        frequencyOfSavingData: frequencyOfSavingData.toDTO(),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        frequencyOfSavingData,
        deviceIp,
      ];
}
