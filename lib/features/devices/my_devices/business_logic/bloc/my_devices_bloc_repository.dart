import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/use_cases/my_devices_use_case.dart';
import 'package:apicultores_app/features/devices/my_devices/data/data_sources/bee_device_connection_data_source.dart';
import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/data/data_sources/connectivity_data_source.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/data/data_sources/network_info_data_source.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/data/repositories/available_wi_fi_repository.dart';

class MyDevicesBlocRepository {
  final MyDevicesBloc myDevicesBloc;

  const MyDevicesBlocRepository._({
    required this.myDevicesBloc,
  });
  static MyDevicesBlocRepository? _instance;
  factory MyDevicesBlocRepository() {
    _instance ??= MyDevicesBlocRepository._(
      myDevicesBloc: MyDevicesBloc(
        MyDevicesUseCase(
          beeDeviceRepository: BeeDeviceRepository(
            beeDeviceConnectionDataSource: BeeDeviceConnectionDataSource(),
          ),
          availableWiFiRepository: AvailableWiFiRepository(
            connectivityDataSource: ConnectivityDataSource(),
            networkPlusDataSource: NetworkInfoDataSource(),
          ),
        ),
      ),
    );
    return _instance!;
  }
}
