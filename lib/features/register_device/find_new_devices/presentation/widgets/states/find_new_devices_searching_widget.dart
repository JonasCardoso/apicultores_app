import 'package:apicultores_app/features/register_device/find_new_devices/presentation/widgets/devices_list/find_new_devices_list_widget.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class FindNewDevicesSearchingWidget extends StatelessWidget {
  const FindNewDevicesSearchingWidget({
    super.key,
    required this.devices,
    required this.navigationDelegate,
  });
  final List<BluetoothDeviceEntity> devices;
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: Spacing.medium,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: Spacing.large,
                    width: Spacing.large,
                    child: CircularProgressIndicator(),
                  ),
                  const SizedBox(
                    width: Spacing.medium,
                  ),
                  Text(
                    Strings.findNewDevicesListWidgetSearchingLabel,
                    style: MyTypography.captionRegular,
                  )
                ],
              ),
              const SizedBox(
                height: Spacing.medium,
              ),
            ],
          ),
        ),
        FindNewDevicesListWidget(
          devices: devices,
          navigationDelegate: navigationDelegate,
        ),
      ],
    );
  }
}
