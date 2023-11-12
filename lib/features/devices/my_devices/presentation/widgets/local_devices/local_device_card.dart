import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class LocalDeviceCard extends StatelessWidget {
  const LocalDeviceCard({super.key, required this.localDevice});
  final LocalBeeDeviceEntity localDevice;
  @override
  Widget build(BuildContext context) {
    final isConnected = localDevice.status == LocalBeeDeviceStatus.connected;
    return Container(
      padding: const EdgeInsets.all(Spacing.small),
      decoration: BoxDecoration(
        color: SurfaceColor.foregroundColor,
        borderRadius: BorderRadius.circular(Spacing.small),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const MyIcon(
                Icons.devices,
                color: SurfaceColor.primary,
                iconSize: IconSize.medium,
              ),
              const SizedBox(
                width: Spacing.small,
              ),
              MyIcon(
                isConnected ? Icons.wifi : Icons.error,
                color: isConnected ? SurfaceColor.success : SurfaceColor.error,
                iconSize: IconSize.medium,
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            localDevice.device.name,
            style: MyTypography.h3,
          ),
          if (!isConnected) ...[
            const SizedBox(
              height: Spacing.small,
            ),
            Text(
              Strings.devicesLocalCardDisconnectedMessage,
              style: MyTypography.small,
            ),
          ],
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
