import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_dto.dart';
import 'package:equatable/equatable.dart';

class BeeDeviceWithIpDTO extends Equatable {
  final BeeDeviceDTO beeDeviceDTO;
  final String deviceIp;

  const BeeDeviceWithIpDTO({
    required this.beeDeviceDTO,
    required this.deviceIp,
  });

  @override
  List<Object?> get props => [beeDeviceDTO, deviceIp];
}
