import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/devices/shared/data/data_sources/bluetooth_data_source.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class FindNewDevicesRepository {
  final BluetoothDataSource _bluetoothDataSource;

  FindNewDevicesRepository({
    required BluetoothDataSource bluetoothDataSource,
  }) : _bluetoothDataSource = bluetoothDataSource;

  Future<void> startScan(Duration timeout) async {
    await _bluetoothDataSource.startScan(timeout);
  }

  Future<void> stopScan() async {
    await _bluetoothDataSource.stopScan();
  }

  Stream<List<BluetoothDeviceEntity>> get scanResults =>
      _bluetoothDataSource.scanResults.map(
        (resultList) =>
            resultList.map((result) => BluetoothDeviceEntity(result)).toList(),
      );

  Future<bool> isBluetoothAvailable() =>
      _bluetoothDataSource.isBluetoothAvailable();

  Future<void> turnOnBluetooth() async {
    await _bluetoothDataSource.turnOnBluetooth();
  }

  Stream<bool> get isScanning => _bluetoothDataSource.isScanning;

  Stream<bool> get isBluetoothTurnedOn => _bluetoothDataSource.state.map(
        (state) => state == BluetoothAdapterState.on,
      );
}
