import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class AddNewDeviceButton extends StatelessWidget {
  const AddNewDeviceButton({
    super.key,
    required this.navigationDelegate,
  });
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return Button(
      label: Strings.addNewDeviceButton,
      variant: ButtonVariant.outlined,
      fill: true,
      icon: Icons.add,
      onPressed: () {
        navigationDelegate.navigateToFindDevices();
      },
    );
  }
}
