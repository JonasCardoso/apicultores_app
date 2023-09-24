import 'package:apicultores_app/features/devices/find_new_devices/presentation/bloc/find_new_devices_bloc/find_new_devices_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindNewDevicesBluetoothInactiveWidget extends StatelessWidget {
  const FindNewDevicesBluetoothInactiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.bluetooth_disabled,
      iconColor: Colors.blue,
      title: Strings.findNewDevicesBluetoothInactiveTitle,
      description: Strings.findNewDevicesBluetoothInactiveSubtitle,
      buttonLabel: Strings.findNewDevicesBluetoothInactiveButtonLabel,
      onButtonClick: () {
        BlocProvider.of<FindNewDevicesBloc>(context).add(
          FindNewDevicesBluetoothActivated(),
        );
      },
    );
  }
}
