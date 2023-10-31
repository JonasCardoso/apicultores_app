import 'package:apicultores_app/di/app_composition_root.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/navigation/save_device_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class SaveDeviceSuccessWidget extends StatelessWidget {
  const SaveDeviceSuccessWidget({super.key, required this.navigationDelegate});

  final SaveDeviceNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.devices,
      iconColor: SurfaceColor.success,
      title: Strings.saveDeviceSuccessTitle,
      description: Strings.saveDeviceSuccessDescription,
      buttonLabel: Strings.saveDeviceSuccessButtonLabel,
      onButtonClick: () {
        AppCompositionRoot().makeMyDevicesBloc().add(const MyDevicesFetched());
        navigationDelegate.navigateToDevices();
      },
    );
  }
}
