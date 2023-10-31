part of 'device_bluetooth_connection_bloc.dart';

sealed class DeviceBluetoothConnectionEvent extends Equatable {
  const DeviceBluetoothConnectionEvent();

  @override
  List<Object> get props => [];
}

final class DeviceBluetoothConnectionStarted
    extends DeviceBluetoothConnectionEvent {}

final class DeviceBluetoothConnectionConnected
    extends DeviceBluetoothConnectionEvent {}

final class DeviceBluetoothConnectionDisconnected
    extends DeviceBluetoothConnectionEvent {}

final class DeviceBluetoothConnectionListened
    extends DeviceBluetoothConnectionEvent {}

final class DeviceBluetoothConnectionFailureAdded
    extends DeviceBluetoothConnectionEvent {
  final Exception error;

  const DeviceBluetoothConnectionFailureAdded({
    required this.error,
  });
}
