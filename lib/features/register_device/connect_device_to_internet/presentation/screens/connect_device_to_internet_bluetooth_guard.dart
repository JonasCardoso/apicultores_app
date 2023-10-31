import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/device_bluetooth_feedback/device_bluetooth_feedback_error.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/device_bluetooth_feedback/device_bluetooth_feedback_loading.dart';
import 'package:apicultores_app/features/register_device/device_bluetooth_connection/presentation/widgets/device_bluetooth_connection_guard.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:design_system/design_system.dart';

class ConnectDeviceToInternetBluetoothGuard extends StatelessWidget {
  const ConnectDeviceToInternetBluetoothGuard({
    super.key,
    required this.deviceEntity,
    required this.child,
  });
  final BluetoothDeviceEntity deviceEntity;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return DeviceBluetoothConnectionGuard(
      deviceEntity: deviceEntity,
      connected: child,
      initial: const DeviceBluetoothFeedBackError(),
      loading: const DeviceBluetoothFeedBackLoading(),
      error: const DeviceBluetoothFeedBackError(),
    );
  }
}
