import 'package:network_info_plus/network_info_plus.dart';

class NetworkInfoDataSource {
  Future<String?> getWiFiName() async {
    return await NetworkInfo().getWifiName();
  }

  Future<String?> getWifiIP() async {
    return await NetworkInfo().getWifiIP() ?? '';
  }
}
