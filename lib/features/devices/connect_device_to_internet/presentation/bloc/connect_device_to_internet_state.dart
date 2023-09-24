part of 'connect_device_to_internet_bloc.dart';

sealed class ConnectDeviceToInternetState extends Equatable {
  const ConnectDeviceToInternetState();

  @override
  List<Object> get props => [];
}

sealed class ConnectDeviceToInternetWaiting
    extends ConnectDeviceToInternetState {}

sealed class ConnectDeviceToInternetFailure
    extends ConnectDeviceToInternetState {}

final class ConnectDeviceToInternetFindingWiFi
    extends ConnectDeviceToInternetWaiting {}

final class ConnectDeviceToInternetWiFiOff
    extends ConnectDeviceToInternetState {}

final class ConnectDeviceToInternetWiFiLoading
    extends ConnectDeviceToInternetWaiting {}

final class ConnectDeviceToInternetGenericFailure
    extends ConnectDeviceToInternetFailure {
  ConnectDeviceToInternetGenericFailure({
    required this.error,
  });

  final Exception error;

  @override
  List<Object> get props => [
        error,
      ];

  @override
  String toString() {
    return 'AvailableWiFisFailure { error: $error }';
  }
}

final class ConnectDeviceToInternetWiFiFailure
    extends ConnectDeviceToInternetFailure {}

final class ConnectDeviceToInternetWifiAvailable
    extends ConnectDeviceToInternetState {
  const ConnectDeviceToInternetWifiAvailable({
    required this.wiFiName,
  });

  final String wiFiName;

  @override
  List<Object> get props => [
        wiFiName,
      ];
}
