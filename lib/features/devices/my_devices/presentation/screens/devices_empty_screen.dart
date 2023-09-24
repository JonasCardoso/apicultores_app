import 'package:apicultores_app/features/devices/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class DevicesEmptyScreen extends StatelessWidget {
  const DevicesEmptyScreen({
    super.key,
    required this.navigationDelegate,
  });
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
        icon: Icons.device_unknown_sharp,
        title: Strings.devicesEmptyScreenTitle,
        description: Strings.devicesEmptyDescription,
        buttonLabel: Strings.devicesEmptyButton,
        onButtonClick: () {
          navigationDelegate.navigateToFindDevices();
        });
  }
}
