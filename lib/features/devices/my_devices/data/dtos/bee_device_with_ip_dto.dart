import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_dto.dart';
import 'package:equatable/equatable.dart';

class BeeDeviceWithIpDTO extends Equatable {
  final BeeDeviceDTO beeDeviceDTO;
  final String deviceIp;

  const BeeDeviceWithIpDTO({
    required this.beeDeviceDTO,
    required this.deviceIp,
  });

  factory BeeDeviceWithIpDTO.fromJson(Map<String, dynamic> json) =>
      BeeDeviceWithIpDTO(
        beeDeviceDTO: BeeDeviceDTO.fromJson(json),
        deviceIp: json['deviceIp'],
      );

  Map<String, dynamic> toJson() => {
        ...beeDeviceDTO.toJson(),
        'deviceIp': deviceIp,
      };

  @override
  List<Object?> get props => [beeDeviceDTO, deviceIp];
}
