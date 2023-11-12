import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:equatable/equatable.dart';

class LocalBeeDeviceEntity extends Equatable {
  final BeeDeviceEntity device;
  final LocalBeeDeviceStatus status;

  const LocalBeeDeviceEntity({
    required this.device,
    required this.status,
  });

  @override
  List<Object?> get props => [
        device,
        status,
      ];
}

enum LocalBeeDeviceStatus {
  connected,
  disconnected,
}
