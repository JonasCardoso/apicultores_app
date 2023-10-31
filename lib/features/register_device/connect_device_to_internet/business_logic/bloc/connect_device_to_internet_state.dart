part of 'connect_device_to_internet_bloc.dart';

sealed class ConnectDeviceToInternetState extends Equatable {
  const ConnectDeviceToInternetState();

  @override
  List<Object> get props => [];
}

final class ConnectDeviceToInternetInitial
    extends ConnectDeviceToInternetState {
  final String wiFiName;

  const ConnectDeviceToInternetInitial(
    this.wiFiName,
  );

  @override
  List<Object> get props => [wiFiName];
}

final class ConnectDeviceToInternetLoading
    extends ConnectDeviceToInternetState {}

final class ConnectDeviceToInternetSuccess
    extends ConnectDeviceToInternetState {
  final String deviceIp;

  const ConnectDeviceToInternetSuccess({required this.deviceIp});
}

final class ConnectDeviceToInternetFailure
    extends ConnectDeviceToInternetState {}
