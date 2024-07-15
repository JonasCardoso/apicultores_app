import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothDeviceEntity extends Equatable {
  final ScanResult _scanResult;
  const BluetoothDeviceEntity(this._scanResult);

  String get name => _scanResult.device.platformName;
  String get remoteId => _scanResult.device.remoteId.str;
  String get type => _scanResult.device.name;

  Future<void> Function({Duration timeout, bool autoConnect}) get connect =>
      _scanResult.device.connect;
  Future<void> Function({int timeout}) get disconnect =>
      _scanResult.device.disconnect;
  Stream<bool> get isConnectStream => _scanResult.device.connectionState
      .map((event) => event == BluetoothConnectionState.connected);

  Future<void> write(String data) async {
    final services = await _scanResult.device.discoverServices();
    final writeService = services.firstWhere(
      (service) => service.uuid.toString() == _bleServiceUuid,
    );
    final writeCharacteristic = writeService.characteristics.firstWhere(
      (characteristic) =>
          characteristic.uuid.toString() == _writeCharacteristicUuid,
    );
    await writeCharacteristic.splitWrite(data.codeUnits, 20);
  }

  Future<Stream<String>> getOnValueReceivedStream() async {
    final services = await _scanResult.device.discoverServices();

    final readService = services.firstWhere(
      (service) => service.uuid.toString() == _bleServiceUuid,
    );
    final readCharacteristic = readService.characteristics.firstWhere(
      (characteristic) =>
          characteristic.uuid.toString() == _readCharacteristicUuid,
    );
    await readCharacteristic.setNotifyValue(true);
    return readCharacteristic.onValueReceived
        .map((event) => String.fromCharCodes(event));
  }

  @override
  List<Object?> get props => [name, remoteId, type];
}

const _bleServiceUuid = "6e400001-b5a3-f393-e0a9-e50e24dcca9e";
const _writeCharacteristicUuid = "6e400002-b5a3-f393-e0a9-e50e24dcca9e";
const _readCharacteristicUuid = "6e400003-b5a3-f393-e0a9-e50e24dcca9e";

extension _SplitWrite on BluetoothCharacteristic {
  Future<void> splitWrite(List<int> value, int mtu, {int timeout = 15}) async {
    int chunk = mtu - 3;
    for (int i = 0; i < value.length; i += chunk) {
      List<int> subvalue = value.sublist(i, min(i + chunk, value.length));
      await write(subvalue, withoutResponse: false, timeout: timeout);
    }
  }
}
