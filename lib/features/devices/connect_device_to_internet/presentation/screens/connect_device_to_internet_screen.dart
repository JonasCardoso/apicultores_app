import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/screens/connect_device_to_internet_screen_builder.dart';
import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
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
    return const SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Strings.connectDeviceToInternetTitle,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.large,
          ),
          child: ConnectDeviceToInternetScreenBuilder(),
        ),
      ),
    );
  }
}
