import 'package:apicultores_app/features/register_device/wi_fi_connection/data/data_sources/connectivity_data_source.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/data/data_sources/network_info_data_source.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/data/exceptions/connect_device_to_internet_exceptions.dart';

class AvailableWiFiRepository {
  final ConnectivityDataSource _connectivityDataSource;
  final NetworkInfoDataSource _networkPlusDataSource;

  AvailableWiFiRepository({
    required ConnectivityDataSource connectivityDataSource,
    required NetworkInfoDataSource networkPlusDataSource,
  })  : _connectivityDataSource = connectivityDataSource,
        _networkPlusDataSource = networkPlusDataSource;

  Stream<bool> get isConnectedToWiFiStream =>
      _connectivityDataSource.isConnectedToWiFiStream;
  Future<bool> isConnectedToWifi() async =>
      await _connectivityDataSource.isConnectedToWifi;
  Future<String> getWiFiName() async {
    final wifiName = await _networkPlusDataSource.getWiFiName();
    if (wifiName != null) {
      return wifiName;
    } else {
      throw WiFiInformationNotAvailableException();
    }
  }

  Future<String> getSubnet() async {
    final ip = await _networkPlusDataSource.getWifiIP();
    if (ip != null) {
      final subnet = ip.substring(0, ip.lastIndexOf('.'));
      return subnet;
    } else {
      throw WiFiInformationNotAvailableException();
    }
  }
}
