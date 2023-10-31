import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class DeviceBluetoothFeedBackError extends StatelessWidget {
  const DeviceBluetoothFeedBackError({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
        icon: Icons.bluetooth_disabled,
        iconColor: SurfaceColor.error,
        title: Strings.deviceLostConnectionToBluetooth,
        description: Strings.deviceLostConnectionToBluetoothDescription,
        buttonLabel: Strings.backToConnectAgain,
        onButtonClick: () {
          Navigator.pop(context);
        });
  }
}
