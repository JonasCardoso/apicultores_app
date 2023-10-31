import 'package:apicultores_app/features/register_device/find_new_devices/data/repositories/find_new_devices_repository.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';

class FindNewDevicesUseCase {
  final FindNewDevicesRepository _findNewDevicesRepository;

  FindNewDevicesUseCase({
    required FindNewDevicesRepository findNewDevicesRepository,
  }) : _findNewDevicesRepository = findNewDevicesRepository;

  Future<void> startScan(Duration timeout) async {
    await _findNewDevicesRepository.startScan(timeout);
  }

  Future<void> stopScan() async {
    await _findNewDevicesRepository.stopScan();
  }

  Stream<List<BluetoothDeviceEntity>> get scanResults =>
      _findNewDevicesRepository.scanResults.map(
        (results) => results
            .where((scanResult) => scanResult.type != 'unknown')
            .toList(),
      );

  Stream<bool> get isScanning => _findNewDevicesRepository.isScanning;
}
