import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:design_system/design_system.dart';

class ConnectionMessageWidget extends StatelessWidget {
  const ConnectionMessageWidget({super.key, required this.status});
  final LocalBeeDeviceStatus status;
  @override
  Widget build(BuildContext context) {
    final isConnected = status == LocalBeeDeviceStatus.connected;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const MyIcon(
          Icons.devices,
          color: SurfaceColor.primary,
          iconSize: IconSize.medium,
        ),
        const SizedBox(
          width: Spacing.xtiny,
        ),
        MyIcon(
          Icons.wifi,
          color: isConnected ? SurfaceColor.success : SurfaceColor.error,
          iconSize: IconSize.medium,
        ),
        const SizedBox(
          width: Spacing.small,
        ),
        Text(
          isConnected
              ? 'Seu dispositivo está conectado à internet!'
              : 'Seu dispositivo não está conectado à internet!',
          style: MyTypography.captionRegular,
        ),
      ],
    );
  }
}
