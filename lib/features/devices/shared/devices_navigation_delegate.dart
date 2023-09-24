import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DevicesNavigationDelegate {
  void navigateToFindDevices() {
    Modular.to.pushNamed('/devices/find/new');
  }

  void navigateToSaveDevice(BluetoothDeviceEntity scanResult) {
    Modular.to.pushNamed('/devices/save', arguments: scanResult);
  }

  void navigateToConnectDeviceToInternet(BluetoothDeviceEntity scanResult) {
    Modular.to.pushNamed('/devices/connect/internet', arguments: scanResult);
  }
}
