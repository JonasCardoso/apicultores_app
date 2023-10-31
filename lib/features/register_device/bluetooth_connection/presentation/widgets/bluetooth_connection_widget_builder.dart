import 'package:apicultores_app/features/register_device/bluetooth_connection/business_logic/bloc/bluetooth_connection_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BluetoothConnectionWidgetBuilder extends StatelessWidget {
  const BluetoothConnectionWidgetBuilder(
      {super.key,
      required this.bluetoothOn,
      required this.bluetoothOff,
      this.bluetoothUnavailable});
  final Widget bluetoothOn;
  final Widget bluetoothOff;
  final Widget? bluetoothUnavailable;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BluetoothConnectionBloc, BluetoothConnectionState>(
      builder: (context, state) => switch (state) {
        BluetoothConnectionSuccess _ => bluetoothOn,
        BluetoothConnectionInactive _ => bluetoothOff,
        BluetoothConnectionUnavailable _ =>
          bluetoothUnavailable ?? bluetoothOff,
        BluetoothConnectionInitial _ => Container(),
      },
    );
  }
}
