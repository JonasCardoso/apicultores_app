abstract class ConnectDeviceToInternetException implements Exception {
  final String message;

  ConnectDeviceToInternetException(this.message);

  @override
  String toString() => 'ConnectDeviceToInternetException: $message';
}

class ConnectDeviceToInternetWiFiNotAvailableException
    extends ConnectDeviceToInternetException {
  ConnectDeviceToInternetWiFiNotAvailableException()
      : super("WiFi name returned Null");
}
