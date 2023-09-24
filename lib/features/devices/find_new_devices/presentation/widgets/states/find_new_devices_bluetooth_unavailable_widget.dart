import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class FindNewDevicesBluetoothUnavailableWidget extends StatelessWidget {
  const FindNewDevicesBluetoothUnavailableWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.bluetooth_disabled,
      iconColor: SurfaceColor.error,
      title: Strings.findNewDevicesBluetoothUnavailableTitle,
      description: Strings.findNewDevicesBluetoothUnavailableDescription,
      buttonLabel: Strings.findNewDevicesBluetoothUnavailableButtonLabel,
      onButtonClick: () {
        Navigator.of(context).pop();
      },
    );
  }
}
