import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_location_dto.dart';
import 'package:equatable/equatable.dart';

class BeeDeviceLocationEntity extends Equatable {
  final double latitude;
  final double longitude;

  const BeeDeviceLocationEntity({
    required this.latitude,
    required this.longitude,
  });

  factory BeeDeviceLocationEntity.fromDTO(BeeDeviceLocationDTO dto) =>
      BeeDeviceLocationEntity(
        latitude: dto.latitude,
        longitude: dto.longitude,
      );

  BeeDeviceLocationDTO toDTO() => BeeDeviceLocationDTO(
        latitude: latitude,
        longitude: longitude,
      );

  @override
  List<Object?> get props => [
        latitude,
        longitude,
      ];
}
