import 'package:apicultores_app/features/devices/my_devices/presentation/screens/devices_bloc_provider.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/screens/devices_screen_builder.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/screens/devices_screen_wifi_guard.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const navigationDelegate = DevicesNavigationDelegate();
    return const Scaffold(
      appBar: AppBar(
        title: Strings.devicesScreenTitle,
        showBackButton: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.large,
        ),
        child: DevicesScreenWifiGuard(
          child: DevicesBlocProvider(
            child: DevicesScreenBuilder(
              navigationDelegate: navigationDelegate,
            ),
          ),
        ),
      ),
    );
  }
}
