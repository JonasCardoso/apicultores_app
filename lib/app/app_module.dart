import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/screens/connect_device_to_internet_screen.dart';
import 'package:apicultores_app/features/register_device/find_new_devices/presentation/screens/find_new_devices_screen.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/screens/save_device_screen.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/services/location_picker/presentation/screens/location_picker_screen.dart';
import 'package:apicultores_app/home/presentation/screens/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const HomeScreen(),
    );
    r.child(
      '/devices/find/new',
      child: (context) => const FindNewDevicesScreen(),
      transition: TransitionType.rightToLeftWithFade,
    );
    r.child(
      '/devices/save',
      child: (context) => SaveDeviceScreen(
        deviceIp: r.args.data as String,
      ),
    );
    r.child(
      '/devices/connect/internet',
      child: (context) => ConnectDeviceToInternetScreen(
        deviceEntity: r.args.data as BluetoothDeviceEntity,
      ),
    );
    r.child(
      '/pick-location',
      child: (context) => const LocationPickerScreen(),
    );
    super.routes(r);
  }
}
