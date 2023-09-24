import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/screens/connect_device_to_internet_screen.dart';
import 'package:apicultores_app/features/devices/find_new_devices/presentation/screens/find_new_devices_screen.dart';
import 'package:apicultores_app/features/devices/save_device/presentation/save_device_screen.dart';
import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
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
        deviceEntity: r.args.data as BluetoothDeviceEntity,
      ),
    );
    r.child(
      '/devices/connect/internet',
      child: (context) => ConnectDeviceToInternetScreen(
        deviceEntity: r.args.data as BluetoothDeviceEntity,
      ),
    );
    super.routes(r);
  }
}
