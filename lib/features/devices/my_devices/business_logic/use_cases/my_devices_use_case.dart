import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';

import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';

class MyDevicesUseCase {
  final BeeDeviceRepository _beeDeviceRepository;

  MyDevicesUseCase({
    required BeeDeviceRepository beeDeviceRepository,
  }) : _beeDeviceRepository = beeDeviceRepository;

  Future<List<BeeDeviceEntity>> getLocalDevices() async {
    return _beeDeviceRepository.getLocalDevices();
  }

  Future<void> saveDeviceLocally({
    required BeeDeviceEntity beeDeviceEntity,
  }) async {
    await _beeDeviceRepository.saveDeviceLocally(
      beeDeviceEntity: beeDeviceEntity,
    );
  }

  Future<bool> isLocalDeviceConnected(BeeDeviceEntity beeDeviceEntity) {
    return _beeDeviceRepository.isLocalDeviceConnected(beeDeviceEntity);
  }
}
