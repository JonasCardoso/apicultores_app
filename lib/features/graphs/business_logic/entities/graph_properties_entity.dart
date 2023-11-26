import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_with_ip_dto.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_period_entity.dart';
import 'package:apicultores_app/features/graphs/data/dtos/graph_properties_dto.dart';
import 'package:equatable/equatable.dart';

class GraphPropertiesEntity extends Equatable {
  final BeeDeviceEntity device;
  final GraphPeriodEntity period;

  const GraphPropertiesEntity({
    required this.device,
    required this.period,
  });

  GraphPropertiesDTO toDTO() {
    return GraphPropertiesDTO(
      device: BeeDeviceWithIpDTO(
        beeDeviceDTO: device.toDTO(),
        deviceIp: device.deviceIp,
      ),
      period: period.toDTO(),
    );
  }

  factory GraphPropertiesEntity.fromDTO(GraphPropertiesDTO dto) {
    return GraphPropertiesEntity(
      device:
          BeeDeviceEntity.fromDTO(dto.device.beeDeviceDTO, dto.device.deviceIp),
      period: GraphPeriodEntity.fromDTO(dto.period),
    );
  }

  @override
  List<Object?> get props => [
        device,
        period,
      ];
}
