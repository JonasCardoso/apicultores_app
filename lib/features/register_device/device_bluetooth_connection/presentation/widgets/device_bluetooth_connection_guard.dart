import 'package:apicultores_app/features/register_device/device_bluetooth_connection/business_logic/bloc/device_bluetooth_connection_bloc.dart';
import 'package:apicultores_app/features/register_device/device_bluetooth_connection/presentation/widgets/device_bluetooth_connection_bloc_provider.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceBluetoothConnectionGuard extends StatelessWidget {
  const DeviceBluetoothConnectionGuard({
    super.key,
    required this.deviceEntity,
    required this.connected,
    required this.initial,
    required this.loading,
    required this.error,
    this.onSuccess,
  });
  final BluetoothDeviceEntity deviceEntity;
  final Widget connected;
  final Widget initial;
  final Widget loading;
  final Widget error;
  final VoidCallback? onSuccess;

  @override
  Widget build(BuildContext context) {
    return DeviceBluetoothConnectionBlocProvider(
      deviceEntity: deviceEntity,
      child: BlocConsumer<DeviceBluetoothConnectionBloc,
          DeviceBluetoothConnectionState>(
        builder: (context, state) => switch (state) {
          DeviceBluetoothConnectionInitial _ => initial,
          DeviceBluetoothConnectionLoading _ => loading,
          DeviceBluetoothConnectionSuccess _ ||
          DeviceBluetoothConnectionConnectOn _ =>
            connected,
          DeviceBluetoothConnectionFailure _ => error,
        },
        listener: (context, state) {
          if (state is DeviceBluetoothConnectionSuccess) {
            onSuccess?.call();
          }
        },
      ),
    );
  }
}
