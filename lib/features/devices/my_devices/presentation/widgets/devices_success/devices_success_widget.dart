import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/add_new_device_button.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_list_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_success/devices_success_search_again.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:design_system/design_system.dart';

class MyDevicesSuccessWidget extends StatelessWidget {
  const MyDevicesSuccessWidget(
      {super.key, required this.devices, required this.navigationDelegate});
  final List<BeeDeviceEntity> devices;
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: Spacing.large,
              ),
              const DevicesSuccessSearchAgain(),
              const SizedBox(
                height: Spacing.large,
              ),
              AddNewDeviceButton(
                navigationDelegate: navigationDelegate,
              ),
              const SizedBox(
                height: Spacing.medium,
              ),
            ],
          ),
        ),
        DevicesListWidget(
          devices: devices,
        ),
      ],
    );
  }
}
