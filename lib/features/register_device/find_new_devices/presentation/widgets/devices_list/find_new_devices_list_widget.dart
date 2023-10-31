import 'package:apicultores_app/features/register_device/find_new_devices/presentation/widgets/device_widgets/bluetooth_device_card_widget_builder.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:design_system/design_system.dart';

class FindNewDevicesListWidget extends SliverList {
  FindNewDevicesListWidget({
    super.key,
    required List<BluetoothDeviceEntity> devices,
    required DevicesNavigationDelegate navigationDelegate,
  }) : super(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final device = devices[index];
              return Column(
                children: [
                  BluetoothDeviceCardWidgetBuilder(
                    scanResult: device,
                    navigationDelegate: navigationDelegate,
                  ),
                  const SizedBox(
                    height: Spacing.small,
                  )
                ],
              );
            },
            childCount: devices.length,
          ),
        );
}
