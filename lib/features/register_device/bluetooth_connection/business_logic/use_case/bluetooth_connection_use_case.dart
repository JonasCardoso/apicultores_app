import 'package:apicultores_app/features/register_device/bluetooth_connection/data/repositories/bluetooth_connection_repository.dart';

class BluetoothConnectionUseCase {
  final BluetoothConnectionRepository _bluetoothConnectionRepository;

  BluetoothConnectionUseCase({
    required BluetoothConnectionRepository bluetoothConnectionRepository,
  }) : _bluetoothConnectionRepository = bluetoothConnectionRepository;

  Stream<bool> get isBluetoothTurnedOn =>
      _bluetoothConnectionRepository.isBluetoothTurnedOn;

  Future<bool> isBluetoothAvailable() =>
      _bluetoothConnectionRepository.isBluetoothAvailable();

  Future<void> turnOnBluetooth() async {
    await _bluetoothConnectionRepository.turnOnBluetooth();
  }
}
