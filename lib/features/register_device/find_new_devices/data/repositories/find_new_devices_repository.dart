import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/register_device/shared/data/data_sources/bluetooth_data_source.dart';

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

  Stream<bool> get isScanning => _bluetoothDataSource.isScanning;
}
