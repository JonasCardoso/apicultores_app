import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';

class SaveDeviceUseCase {
  final BeeDeviceRepository _beeDeviceRepository;

  const SaveDeviceUseCase({
    required BeeDeviceRepository beeDeviceRepository,
  }) : _beeDeviceRepository = beeDeviceRepository;

  Future<void> sendBeeDeviceData(BeeDeviceEntity beeDeviceEntity) async {
    await _beeDeviceRepository.sendBeeDeviceData(beeDeviceEntity);
  }
}
