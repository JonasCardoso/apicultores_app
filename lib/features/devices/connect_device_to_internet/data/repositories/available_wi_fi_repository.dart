import 'package:apicultores_app/features/devices/connect_device_to_internet/data/data_sources/connectivity_data_source.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/data/data_sources/network_info_data_source.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/data/exceptions/connect_device_to_internet_exceptions.dart';

class AvailableWiFiRepository {
  final ConnectivityDataSource _connectivityDataSource;
  final NetworkInfoDataSource _networkPlusDataSource;

  AvailableWiFiRepository({
    required ConnectivityDataSource connectivityDataSource,
    required NetworkInfoDataSource networkPlusDataSource,
  })  : _connectivityDataSource = connectivityDataSource,
        _networkPlusDataSource = networkPlusDataSource;

  Stream<bool> get isConnectedToWiFi =>
      _connectivityDataSource.isConnectedToWiFi;

  Future<String> getWiFiName() async {
    final wifiName = await _networkPlusDataSource.getWiFiName();
    if (wifiName != null) {
      return wifiName;
    } else {
      throw ConnectDeviceToInternetWiFiNotAvailableException();
    }
  }
}
