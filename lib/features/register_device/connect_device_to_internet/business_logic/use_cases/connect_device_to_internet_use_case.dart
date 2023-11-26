import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';

class ConnectDeviceToInternetUseCase {
  final BluetoothDeviceEntity _device;
  final String _wiFiName;
  final BeeDeviceRepository _beeDeviceRepository;
  ConnectDeviceToInternetUseCase({
    required BluetoothDeviceEntity device,
    required String wiFiName,
    required BeeDeviceRepository beeDeviceRepository,
  })  : _device = device,
        _wiFiName = wiFiName,
        _beeDeviceRepository = beeDeviceRepository;

  Future<void> connectToWiFi(String wiFiName, String wiFiPassword) async {
    await _device.write("|${wiFiName.replaceAll('"', '')}|$wiFiPassword|");
  }

  Future<Stream<String?>> ipValueStream() =>
      _device.getOnValueReceivedStream().then(
            (stream) => stream.map(
              (response) => response == _notConnectedKey ? null : response,
            ),
          );

  Future<void> disconnectBluetoothOfDevice() async {
    await _device.write("disconnect");
  }

  Future<BeeDeviceEntity?> getPossibleRegisteredDevice(String deviceIp) async {
    final possibleRegisteredDevice =
        await _beeDeviceRepository.getDevice(deviceIp);
    if (possibleRegisteredDevice != null) {
      await _beeDeviceRepository.saveDeviceLocally(
          beeDeviceEntity: possibleRegisteredDevice);
    }
    return possibleRegisteredDevice;
  }

  String get wiFiName => _wiFiName;
}

const _notConnectedKey = 'not_connected';
