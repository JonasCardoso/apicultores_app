import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/devices/find_new_devices/data/repositories/find_new_devices_repository.dart';

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

  Stream<bool> get isBluetoothTurnedOn =>
      _findNewDevicesRepository.isBluetoothTurnedOn;

  Future<bool> isBluetoothAvailable() =>
      _findNewDevicesRepository.isBluetoothAvailable();

  Future<void> turnOnBluetooth() async {
    await _findNewDevicesRepository.turnOnBluetooth();
  }
}
