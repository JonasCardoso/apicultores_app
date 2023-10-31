import 'package:apicultores_app/features/devices/my_devices/data/data_sources/bee_device_connection_data_source.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';

class BeeDeviceRepository {
  final BeeDeviceConnectionDataSource _beeDeviceConnectionDataSource;
  const BeeDeviceRepository({
    required BeeDeviceConnectionDataSource beeDeviceConnectionDataSource,
  }) : _beeDeviceConnectionDataSource = beeDeviceConnectionDataSource;

  Future<void> sendBeeDeviceData(BeeDeviceEntity beeDeviceEntity) async {
    await _beeDeviceConnectionDataSource.sendBeeDeviceData(
      beeDeviceDTO: beeDeviceEntity.toDTO(),
      deviceIp: beeDeviceEntity.deviceIp,
    );
  }

  Stream<List<BeeDeviceEntity>> findDevices(String subnet) {
    return _beeDeviceConnectionDataSource.findDevicesWithIp(subnet).map(
          (beeDevicesWithIpDTO) => beeDevicesWithIpDTO
              .map(
                (beeDeviceWithIpDTO) => BeeDeviceEntity.fromDTO(
                  beeDeviceWithIpDTO.beeDeviceDTO,
                  beeDeviceWithIpDTO.deviceIp,
                ),
              )
              .toList(),
        );
  }
}
