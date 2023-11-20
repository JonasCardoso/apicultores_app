import 'package:apicultores_app/app/guards/tab_guard.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/screens/device_details_screen.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/screens/connect_device_to_internet_screen.dart';
import 'package:apicultores_app/features/register_device/find_new_devices/presentation/screens/find_new_devices_screen.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/screens/save_device_screen.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/services/location_picker/presentation/screens/location_picker_screen.dart';
import 'package:apicultores_app/home/business_logic/bloc/bottom_navigation_bloc_repository.dart';
import 'package:apicultores_app/home/presentation/screens/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomeScreen());
    r.tab(
      '/devices',
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
      '/devices/details',
      child: (context) => DeviceDetailsScreen(
        device: r.args.data as LocalBeeDeviceEntity,
      ),
    );
    r.child(
      '/pick-location',
      child: (context) => const LocationPickerScreen(),
    );

    super.routes(r);
  }
}

extension _TabChild on RouteManager {
  void tab(String path) {
    final route = ChildRoute(
      path,
      child: (_) => const HomeScreen(),
      guards: [
        TabGuard(
          bottomNavigationBloc:
              BottomNavigationBlocRepository().bottomNavigationBloc,
        ),
      ],
    );
    add(route);
  }
}
