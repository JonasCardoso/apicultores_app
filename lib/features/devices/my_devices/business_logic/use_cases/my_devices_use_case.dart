import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/data/repositories/available_wi_fi_repository.dart';

class MyDevicesUseCase {
  final BeeDeviceRepository _beeDeviceRepository;
  final AvailableWiFiRepository _availableWiFiRepository;

  MyDevicesUseCase(
      {required BeeDeviceRepository beeDeviceRepository,
      required AvailableWiFiRepository availableWiFiRepository})
      : _beeDeviceRepository = beeDeviceRepository,
        _availableWiFiRepository = availableWiFiRepository;

  Stream<List<BeeDeviceEntity>> findDevices() async* {
    final subnet = await _availableWiFiRepository.getSubnet();
    yield* _beeDeviceRepository.findDevices(subnet);
  }
}
