part of 'connect_device_to_internet_bloc.dart';

sealed class ConnectDeviceToInternetEvent extends Equatable {
  const ConnectDeviceToInternetEvent();

  @override
  List<Object> get props => [];
}

final class ConnectDeviceToInternetFetched
    extends ConnectDeviceToInternetEvent {}

final class ConnectDeviceToInternetWiFiTurnedOn
    extends ConnectDeviceToInternetEvent {}

final class ConnectDeviceToInternetWiFiTurnedOff
    extends ConnectDeviceToInternetEvent {}
