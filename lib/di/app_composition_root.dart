import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/internet_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc_repository.dart';

class AppCompositionRoot {
  MyDevicesBloc makeMyDevicesBloc() {
    return MyDevicesBlocRepository().myDevicesBloc;
  }

  InternetDevicesBloc makeInternetDevicesBloc() {
    return MyDevicesBlocRepository().internetDevicesBloc;
  }
}
