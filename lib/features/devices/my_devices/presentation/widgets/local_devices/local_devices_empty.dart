import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:design_system/design_system.dart';

class LocalDevicesEmptyWidget extends StatelessWidget {
  const LocalDevicesEmptyWidget({super.key, required this.navigation});

  final DevicesNavigationDelegate navigation;
  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.device_unknown,
      title: "Cadastre o seu primeiro dispositivo!",
      description:
          "Clique no botão abaixo para configurar um novo dispositivo via Bluetooth",
      buttonLabel: "Cadastre um dispositivo",
      onButtonClick: () {
        navigation.navigateToFindDevices();
      },
    );
  }
}
