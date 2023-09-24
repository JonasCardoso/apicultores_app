import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityDataSource {
  Stream<bool> get isConnectedToWiFi =>
      Connectivity().onConnectivityChanged.map(
            (connectivityResult) =>
                connectivityResult == ConnectivityResult.wifi,
          );
}
