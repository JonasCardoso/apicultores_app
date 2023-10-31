import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';

class ConnectDeviceToInternetUseCase {
  final BluetoothDeviceEntity _device;
  final String _wiFiName;
  ConnectDeviceToInternetUseCase({
    required BluetoothDeviceEntity device,
    required String wiFiName,
  })  : _device = device,
        _wiFiName = wiFiName;

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

  String get wiFiName => _wiFiName;
}

const _notConnectedKey = 'not_connected';
