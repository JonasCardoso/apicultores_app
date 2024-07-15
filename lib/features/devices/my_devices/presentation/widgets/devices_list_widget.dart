import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/internet_devices/internet_device_item_card.dart';
import 'package:design_system/design_system.dart';

class DevicesListWidget extends StatelessWidget {
  const DevicesListWidget({
    super.key,
    required this.devices,
  });
  final List<BeeDeviceEntity> devices;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final device = devices[index];
          return Column(
            children: [
              InternetDeviceItemCard(device: device),
              const SizedBox(
                height: Spacing.small,
              ),
            ],
          );
        },
        childCount: devices.length,
      ),
    );
  }
}
