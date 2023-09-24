import 'package:apicultores_app/features/devices/find_new_devices/presentation/bloc/connect_device_bloc/connect_device_bloc.dart';
import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BluetoothDeviceCardBlocProvider extends StatelessWidget {
  const BluetoothDeviceCardBlocProvider({
    super.key,
    required this.scanResult,
    required this.child,
  });
  final Widget child;
  final BluetoothDeviceEntity scanResult;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectDeviceBloc>(
      create: (_) =>
          ConnectDeviceBloc(scanResult)..add(ConnectDeviceListened()),
      child: child,
    );
  }
}
