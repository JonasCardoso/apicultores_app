import 'package:apicultores_app/features/register_device/save_device/presentation/navigation/save_device_navigation_delegate.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/screens/save_device_screen_builder.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/widgets/save_device_bloc_provider.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class SaveDeviceScreen extends StatelessWidget {
  const SaveDeviceScreen({
    super.key,
    required this.deviceIp,
  });
  final String deviceIp;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBar(
          title: Strings.saveDeviceTitle,
          showBackButton: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.large,
          ),
          child: SaveDeviceBlocProvider(
            child: SaveDeviceScreenBuilder(
              deviceIp: deviceIp,
              navigationDelegate: const SaveDeviceNavigationDelegate(),
            ),
          ),
        ),
      ),
    );
  }
}
