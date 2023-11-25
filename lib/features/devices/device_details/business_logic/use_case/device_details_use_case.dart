import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';

class DeviceDetailsUseCase {
  final BeeDeviceRepository _beeDeviceRepository;
  final BeeDeviceEntity _beeDeviceEntity;

  DeviceDetailsUseCase(
      {required BeeDeviceRepository beeDeviceRepository,
      required BeeDeviceEntity beeDeviceEntity})
      : _beeDeviceRepository = beeDeviceRepository,
        _beeDeviceEntity = beeDeviceEntity;

  Future<void> updateDevice(BeeDeviceEntity updatedDevice) async {
    await _beeDeviceRepository.updateDevice(
      updatedDevice,
    );
  }

  Future<void> deleteDevice() async {
    await _beeDeviceRepository.deleteDevice(
      _beeDeviceEntity,
    );
  }

  Future<void> clearData() async {
    await _beeDeviceRepository.clearData(
      _beeDeviceEntity,
    );
  }

  Future<void> disconnect() async {
    await _beeDeviceRepository.disconnect(
      _beeDeviceEntity,
    );
  }
}
