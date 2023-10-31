import 'package:apicultores_app/features/register_device/shared/data/data_sources/bluetooth_data_source.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothConnectionRepository {
  final BluetoothDataSource _bluetoothDataSource;

  BluetoothConnectionRepository({
    required BluetoothDataSource bluetoothDataSource,
  }) : _bluetoothDataSource = bluetoothDataSource;

  Future<bool> isBluetoothAvailable() =>
      _bluetoothDataSource.isBluetoothAvailable();

  Future<void> turnOnBluetooth() async {
    await _bluetoothDataSource.turnOnBluetooth();
  }

  Stream<bool> get isBluetoothTurnedOn => _bluetoothDataSource.state.map(
        (state) => state == BluetoothAdapterState.on,
      );
}
