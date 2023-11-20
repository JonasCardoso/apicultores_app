import 'package:apicultores_app/features/devices/device_details/presentation/device_details_navigation.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/screens/device_details_bloc_provider.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/screens/device_details_screen_builder.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:design_system/design_system.dart';

class DeviceDetailsScreen extends StatelessWidget {
  const DeviceDetailsScreen({
    super.key,
    required this.device,
  });
  final LocalBeeDeviceEntity device;

  @override
  Widget build(BuildContext context) {
    final navigation = DeviceDetailsNavigation();

    return SafeArea(
      child: Scaffold(
        appBar: const AppBar(
          title: 'Detalhes do dispositivo',
        ),
        body: DeviceDetailsBlocProvider(
          beeDeviceEntity: device.device,
          child: DeviceDetailsScreenBuilder(
            device: device,
            navigation: navigation,
          ),
        ),
      ),
    );
  }
}
