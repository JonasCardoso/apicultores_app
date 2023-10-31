import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/add_new_device_button.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_list_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_searching/devices_searching_spinner.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:design_system/design_system.dart';

class DevicesSearchingWidget extends StatelessWidget {
  const DevicesSearchingWidget({
    super.key,
    required this.navigationDelegate,
    required this.devices,
  });
  final DevicesNavigationDelegate navigationDelegate;
  final List<BeeDeviceEntity> devices;
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
              const DevicesSearchingSpinner(),
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
