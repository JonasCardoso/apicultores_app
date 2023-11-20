import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DevicesNavigationDelegate {
  const DevicesNavigationDelegate();
  void navigateToFindDevices() {
    Modular.to.pushNamed('/devices/find/new');
  }

  void navigateToSaveDevice(String deviceIp) {
    Modular.to.navigate('/devices/save', arguments: deviceIp);
  }

  void navigateToConnectDeviceToInternet(BluetoothDeviceEntity scanResult) {
    Modular.to.pushNamed('/devices/connect/internet', arguments: scanResult);
  }

  Future<void> navigateToDetails(LocalBeeDeviceEntity device) {
    return Modular.to.pushNamed('/devices/details', arguments: device);
  }
}
