import 'package:apicultores_app/features/devices/find_new_devices/presentation/screens/find_new_devices_bloc_provider.dart';
import 'package:apicultores_app/features/devices/find_new_devices/presentation/screens/find_new_devices_screen_builder.dart';
import 'package:apicultores_app/features/devices/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class FindNewDevicesScreen extends StatelessWidget {
  const FindNewDevicesScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBar(
          title: Strings.findNewDevicesTitle,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
          child: FindNewDevicesBlocProvider(
            child: FindNewDevicesScreenBuilder(
              navigationDelegate: DevicesNavigationDelegate(),
            ),
          ),
        ),
      ),
    );
  }
}
