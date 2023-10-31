import 'package:apicultores_app/features/register_device/bluetooth_connection/business_logic/bloc/bluetooth_connection_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BluetoothConnectionOffBanner extends StatelessWidget {
  const BluetoothConnectionOffBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.bluetooth_disabled,
      iconColor: Colors.blue,
      title: Strings.findNewDevicesBluetoothInactiveTitle,
      description: Strings.findNewDevicesBluetoothInactiveSubtitle,
      buttonLabel: Strings.findNewDevicesBluetoothInactiveButtonLabel,
      onButtonClick: () {
        BlocProvider.of<BluetoothConnectionBloc>(context).add(
          BluetoothConnectionActivated(),
        );
      },
    );
  }
}
