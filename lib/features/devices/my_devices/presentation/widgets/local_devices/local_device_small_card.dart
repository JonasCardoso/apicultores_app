import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:design_system/design_system.dart';

class LocalDeviceSmallCard extends StatelessWidget {
  const LocalDeviceSmallCard({
    super.key,
    required this.localDevice,
    this.isSelected = true,
  });
  final LocalBeeDeviceEntity localDevice;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final isConnected = localDevice.status == LocalBeeDeviceStatus.connected;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(Spacing.small),
      margin: const EdgeInsets.all(Spacing.small),
      decoration: BoxDecoration(
        color: isSelected
            ? SurfaceColor.primaryPallete.shade200
            : SurfaceColor.foregroundColor,
        borderRadius: BorderRadius.circular(Spacing.small),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MyIcon(
                Icons.devices,
                color: SurfaceColor.secondary,
                iconSize: IconSize.small,
              ),
              const SizedBox(
                height: Spacing.tiny,
              ),
              MyIcon(
                isConnected ? Icons.wifi : Icons.error,
                color: isConnected ? SurfaceColor.success : SurfaceColor.error,
                iconSize: IconSize.small,
              ),
            ],
          ),
          const SizedBox(
            width: Spacing.small,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localDevice.device.name,
                style: MyTypography.bodyStrong,
              ),
              const SizedBox(
                height: Spacing.small,
              ),
              Text(
                "Dados a cada ${localDevice.device.frequencyOfSavingData.text}",
                style: MyTypography.captionRegular,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
