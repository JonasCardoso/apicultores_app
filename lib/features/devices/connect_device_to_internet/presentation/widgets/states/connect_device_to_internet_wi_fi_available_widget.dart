import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class ConnectDeviceToInternetWiFiAvailableWidget extends StatefulWidget {
  const ConnectDeviceToInternetWiFiAvailableWidget(
      {super.key, required this.wifiName});
  final String wifiName;

  @override
  State<ConnectDeviceToInternetWiFiAvailableWidget> createState() =>
      _ConnectDeviceToInternetWiFiAvailableWidgetState();
}

class _ConnectDeviceToInternetWiFiAvailableWidgetState
    extends State<ConnectDeviceToInternetWiFiAvailableWidget> {
  final TextEditingController _wiFiPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyIcon(Icons.wifi, color: SurfaceColor.success),
              const SizedBox(
                height: Spacing.large,
              ),
              Text(
                Strings.connectDeviceToInternetWiFiAvailableTitle(
                    widget.wifiName),
                style: MyTypography.h2,
              ),
              const SizedBox(
                height: Spacing.small,
              ),
              Text(
                Strings.connectDeviceToInternetWiFiAvailableSubtitle,
                style: MyTypography.p,
              ),
              const SizedBox(
                height: Spacing.small,
              ),
              TextField(
                controller: _wiFiPasswordController,
                decoration: InputDecoration(
                  labelText:
                      Strings.connectDeviceToInternetWiFiAvailablePasswordField,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(Spacing.large),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
