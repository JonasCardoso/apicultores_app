import 'package:apicultores_app/features/register_device/device_bluetooth_connection/business_logic/bloc/device_bluetooth_connection_bloc.dart';
import 'package:apicultores_app/features/register_device/device_bluetooth_connection/business_logic/bloc/device_bluetooth_connection_bloc_repository.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceBluetoothConnectionBlocProvider extends StatelessWidget {
  const DeviceBluetoothConnectionBlocProvider(
      {super.key, required this.deviceEntity, required this.child});
  final BluetoothDeviceEntity deviceEntity;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeviceBluetoothConnectionBloc>.value(
      value: DeviceBluetoothConnectionBlocRepository().getBloc(deviceEntity),
      child: child,
    );
  }
}
