import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/screens/connect_device_to_internet_bloc_provider.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/screens/connect_device_to_internet_screen_builder.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/screens/connect_device_to_internet_wi_fi_guard.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class ConnectDeviceToInternetScreen extends StatelessWidget {
  const ConnectDeviceToInternetScreen({
    super.key,
    required this.deviceEntity,
  });

  final BluetoothDeviceEntity deviceEntity;
  @override
  Widget build(BuildContext context) {
    return AppLifecyclePage(
      onPaused: () async {
        await disconnectDevice();
      },
      child: SafeArea(
        child: WillPopScope(
          onWillPop: () async {
            await disconnectDevice();
            return true;
          },
          child: Scaffold(
            appBar: const AppBar(
              title: Strings.connectDeviceToInternetTitle,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.large,
              ),
              child: ConnectDeviceToInternetWiFiGuard(
                buildChild: (wiFiName) => ConnectDeviceToInternetBlocProvider(
                  wiFiName: wiFiName,
                  device: deviceEntity,
                  child: const ConnectDeviceToInternetScreenBuilder(
                    navigationDelegate: DevicesNavigationDelegate(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> disconnectDevice() async {
    await deviceEntity.disconnect();
  }
}
