part of 'connect_device_to_internet_bloc.dart';

sealed class ConnectDeviceToInternetEvent extends Equatable {
  const ConnectDeviceToInternetEvent();

  @override
  List<Object> get props => [];
}

final class ConnectDeviceToInternetStarted
    extends ConnectDeviceToInternetEvent {
  final String wiFiName;
  final String wiFiPassword;

  const ConnectDeviceToInternetStarted({
    required this.wiFiName,
    required this.wiFiPassword,
  });
}

final class ConnectDeviceToInternetFailed extends ConnectDeviceToInternetEvent {
  const ConnectDeviceToInternetFailed();
}

final class ConnectDeviceToInternetConnected
    extends ConnectDeviceToInternetEvent {
  final String deviceIp;
  const ConnectDeviceToInternetConnected(this.deviceIp);
}

final class ConnectDeviceToInternetRetryTapped
    extends ConnectDeviceToInternetEvent {
  const ConnectDeviceToInternetRetryTapped();
}
