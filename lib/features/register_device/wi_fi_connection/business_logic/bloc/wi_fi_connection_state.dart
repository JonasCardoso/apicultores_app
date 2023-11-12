part of 'wi_fi_connection_bloc.dart';

sealed class WiFiConnectionState extends Equatable {
  const WiFiConnectionState();

  @override
  List<Object> get props => [];
}

sealed class WiFiConnectionWaiting extends WiFiConnectionState {}

final class WiFiConnectionFinding extends WiFiConnectionWaiting {}

final class WiFiConnectionOff extends WiFiConnectionState {}

final class WiFiConnectionLoadingInformation extends WiFiConnectionWaiting {}

final class WiFiConnectionFailure extends WiFiConnectionState {
  const WiFiConnectionFailure({
    required this.error,
  });

  final Exception error;

  @override
  String toString() {
    return 'WiFiConnectionFailure{error: $error}';
  }

  @override
  List<Object> get props => [error];
}

final class WiFiConnectionSuccess extends WiFiConnectionState {
  const WiFiConnectionSuccess({
    required this.wiFiName,
  });

  final String wiFiName;

  @override
  List<Object> get props => [
        wiFiName,
      ];
}

final class WiFiLocationNeedsPermission extends WiFiConnectionState {}

final class WiFiLocationPermissionDeny extends WiFiConnectionState {}
