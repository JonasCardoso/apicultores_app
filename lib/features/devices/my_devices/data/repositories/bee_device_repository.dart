import 'package:apicultores_app/features/devices/my_devices/data/data_sources/bee_device_connection_data_source.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/data/data_sources/bee_device_local_data_source.dart';
import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_with_ip_dto.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_data_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_properties_entity.dart';

class BeeDeviceRepository {
  final BeeDeviceConnectionDataSource _beeDeviceConnectionDataSource;
  final BeeDeviceLocalDataSource _beeDeviceLocalDataSource;
  const BeeDeviceRepository({
    required BeeDeviceConnectionDataSource beeDeviceConnectionDataSource,
    required BeeDeviceLocalDataSource beeDeviceLocalDataSource,
  })  : _beeDeviceConnectionDataSource = beeDeviceConnectionDataSource,
        _beeDeviceLocalDataSource = beeDeviceLocalDataSource;

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

  Future<List<BeeDeviceEntity>> getLocalDevices() async {
    final devices = await _beeDeviceLocalDataSource.getDevices();
    return devices
        .map(
          (e) => BeeDeviceEntity.fromDTO(
            e.beeDeviceDTO,
            e.deviceIp,
          ),
        )
        .toList();
  }

  Future<GraphDataEntity> getGraphData(GraphPropertiesEntity properties) =>
      _beeDeviceConnectionDataSource
          .getGraphData(
            properties.toDTO(),
          )
          .then(
            (value) => GraphDataEntity.fromDTO(value),
          );

  Future<void> saveDeviceLocally({
    required BeeDeviceEntity beeDeviceEntity,
  }) async {
    await _beeDeviceLocalDataSource.saveDevice(
      BeeDeviceWithIpDTO(
        beeDeviceDTO: beeDeviceEntity.toDTO(),
        deviceIp: beeDeviceEntity.deviceIp,
      ),
    );
  }

  Future<bool> isLocalDeviceConnected(BeeDeviceEntity beeDeviceEntity) async {
    try {
      final deviceData = await _beeDeviceConnectionDataSource
          .getDeviceData(beeDeviceEntity.deviceIp);
      return deviceData.id == beeDeviceEntity.id;
    } catch (e, __) {
      return false;
    }
  }
}
