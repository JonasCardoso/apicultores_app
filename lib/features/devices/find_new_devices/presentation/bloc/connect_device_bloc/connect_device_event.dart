part of 'connect_device_bloc.dart';

sealed class ConnectDeviceEvent extends Equatable {
  const ConnectDeviceEvent();

  @override
  List<Object> get props => [];
}

final class ConnectDeviceStarted extends ConnectDeviceEvent {}

final class ConnectDeviceConnected extends ConnectDeviceEvent {}

final class ConnectDeviceListened extends ConnectDeviceEvent {}
