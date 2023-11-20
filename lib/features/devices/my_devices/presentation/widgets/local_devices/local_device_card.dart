import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class LocalDeviceCard extends StatelessWidget {
  const LocalDeviceCard._(
      {required this.localDevice,
      required bool showDetail,
      required this.onPressed})
      : _showDetail = showDetail;
  final LocalBeeDeviceEntity localDevice;
  final VoidCallback? onPressed;
  final bool _showDetail;

  factory LocalDeviceCard({
    required LocalBeeDeviceEntity localDevice,
    VoidCallback? onPressed,
  }) =>
      LocalDeviceCard._(
        localDevice: localDevice,
        showDetail: false,
        onPressed: onPressed,
      );
  factory LocalDeviceCard.detail(
          {required LocalBeeDeviceEntity localDevice,
          VoidCallback? onPressed}) =>
      LocalDeviceCard._(
        localDevice: localDevice,
        showDetail: true,
        onPressed: onPressed,
      );
  @override
  Widget build(BuildContext context) {
    final isConnected = localDevice.status == LocalBeeDeviceStatus.connected;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(Spacing.small),
        margin: const EdgeInsets.all(Spacing.xtiny),
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
                  color:
                      isConnected ? SurfaceColor.success : SurfaceColor.error,
                  iconSize: IconSize.medium,
                ),
              ],
            ),
            const SizedBox(
              height: Spacing.medium,
            ),
            Text(
              localDevice.device.name,
              style: MyTypography.h5Strong,
            ),
            if (!isConnected) ...[
              const SizedBox(
                height: Spacing.small,
              ),
              Text(
                Strings.devicesLocalCardDisconnectedMessage,
                style: MyTypography.captionRegular,
              ),
            ],
            if (_showDetail) ...[
              const SizedBox(
                height: Spacing.small,
              ),
              Text(
                "Dados a cada ${localDevice.device.frequencyOfSavingData.text}",
                style: MyTypography.captionRegular,
              ),
            ],
            const Expanded(
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
