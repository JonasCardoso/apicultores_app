import 'package:apicultores_app/features/devices/my_devices/presentation/screens/devices_empty_screen.dart';
import 'package:apicultores_app/features/devices/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationDelegate = DevicesNavigationDelegate();
    return Scaffold(
        appBar: const AppBar(
          title: Strings.devicesScreenTitle,
          showBackButton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.large,
          ),
          child: DevicesEmptyScreen(
            navigationDelegate: navigationDelegate,
          ),
        ));
  }
}
