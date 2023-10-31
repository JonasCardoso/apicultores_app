import 'package:apicultores_app/features/register_device/bluetooth_connection/presentation/widgets/bluetooth_connection_guard.dart';
import 'package:apicultores_app/features/register_device/bluetooth_connection/presentation/widgets/bluetooth_connection_off_banner.dart';
import 'package:apicultores_app/features/register_device/bluetooth_connection/presentation/widgets/bluetooth_connection_unavailable_widget.dart';
import 'package:design_system/design_system.dart';

class FindNewDevicesBluetoothGuard extends StatelessWidget {
  const FindNewDevicesBluetoothGuard({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BluetoothConnectionGuard(
      bluetoothOn: child,
      bluetoothOff: const BluetoothConnectionOffBanner(),
      bluetoothUnavailable: const BluetoothConnectionUnavailableWidget(),
    );
  }
}
