import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityDataSource {
  Stream<bool> get isConnectedToWiFiStream =>
      Connectivity().onConnectivityChanged.map(
            (connectivityResult) =>
                connectivityResult == ConnectivityResult.wifi,
          );
  Future<bool> get isConnectedToWifi async =>
      await Connectivity().checkConnectivity() == ConnectivityResult.wifi;
}
