abstract class WiFiConnectionException implements Exception {
  final String message;

  WiFiConnectionException(this.message);

  @override
  String toString() => 'ConnectDeviceToInternetException: $message';
}

class WiFiInformationNotAvailableException extends WiFiConnectionException {
  WiFiInformationNotAvailableException() : super("WiFi name returned Null");
}
