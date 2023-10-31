import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/screens/connect_device_to_internet_wi_fi_guard.dart';
import 'package:flutter/material.dart';

class DevicesScreenWifiGuard extends StatelessWidget {
  const DevicesScreenWifiGuard({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    //TODO: change texts
    return ConnectDeviceToInternetWiFiGuard(
      buildChild: (_) {
        return child;
      },
    );
  }
}
