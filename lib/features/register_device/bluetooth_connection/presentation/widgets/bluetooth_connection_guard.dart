import 'package:apicultores_app/features/register_device/bluetooth_connection/presentation/widgets/bluetooth_connection_bloc_provider.dart';
import 'package:apicultores_app/features/register_device/bluetooth_connection/presentation/widgets/bluetooth_connection_widget_builder.dart';
import 'package:design_system/design_system.dart';

class BluetoothConnectionGuard extends StatelessWidget {
  const BluetoothConnectionGuard({
    super.key,
    required this.bluetoothOn,
    required this.bluetoothOff,
    this.bluetoothUnavailable,
  });
  final Widget bluetoothOn;
  final Widget bluetoothOff;
  final Widget? bluetoothUnavailable;
  @override
  Widget build(BuildContext context) {
    return BluetoothConnectionBlocProvider(
      child: BluetoothConnectionWidgetBuilder(
        bluetoothOn: bluetoothOn,
        bluetoothOff: bluetoothOff,
        bluetoothUnavailable: bluetoothUnavailable,
      ),
    );
  }
}
