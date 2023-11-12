import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class AvailableWiFiFeedBackWidget extends StatelessWidget {
  const AvailableWiFiFeedBackWidget({super.key, required this.wifiName});
  final String wifiName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyIcon(
          Icons.wifi,
          color: SurfaceColor.success,
          iconSize: IconSize.huge,
        ),
        const SizedBox(
          height: Spacing.large,
        ),
        Text(
          Strings.connectDeviceToInternetWiFiAvailableTitle(
            wifiName,
          ),
          style: MyTypography.h3.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: Spacing.small,
        ),
        Text(
          Strings.connectDeviceToInternetWiFiAvailableSubtitle,
          style: MyTypography.captionRegular,
        ),
        const SizedBox(
          height: Spacing.large,
        ),
      ],
    );
  }
}
