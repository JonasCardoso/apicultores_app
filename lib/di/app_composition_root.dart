import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/internet_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc_repository.dart';
import 'package:apicultores_app/features/devices/my_devices/data/data_sources/bee_device_connection_data_source.dart';
import 'package:apicultores_app/features/devices/my_devices/data/data_sources/bee_device_local_data_source.dart';
import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';

class AppCompositionRoot {
  MyDevicesBloc makeMyDevicesBloc() {
    return MyDevicesBlocRepository().myDevicesBloc;
  }

  InternetDevicesBloc makeInternetDevicesBloc() {
    return MyDevicesBlocRepository().internetDevicesBloc;
  }

  BeeDeviceRepository makeBeeDeviceRepository() {
    return BeeDeviceRepository(
      beeDeviceConnectionDataSource: BeeDeviceConnectionDataSource(),
      beeDeviceLocalDataSource: BeeDeviceLocalDataSource(),
    );
  }
}
