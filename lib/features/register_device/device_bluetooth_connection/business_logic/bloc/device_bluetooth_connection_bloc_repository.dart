import 'package:apicultores_app/features/register_device/device_bluetooth_connection/business_logic/bloc/device_bluetooth_connection_bloc.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';

class DeviceBluetoothConnectionBlocRepository {
  static final _instance = DeviceBluetoothConnectionBlocRepository._();

  factory DeviceBluetoothConnectionBlocRepository() {
    return _instance;
  }

  DeviceBluetoothConnectionBlocRepository._();

  final Map<String, DeviceBluetoothConnectionBloc> _blocsByDevice = {};

  DeviceBluetoothConnectionBloc getBloc(BluetoothDeviceEntity device) {
    final deviceId = device.remoteId;
    if (!_blocsByDevice.containsKey(deviceId)) {
      _blocsByDevice[deviceId] = DeviceBluetoothConnectionBloc(device)
        ..add(DeviceBluetoothConnectionListened());
    }
    return _blocsByDevice[deviceId]!;
  }
}
