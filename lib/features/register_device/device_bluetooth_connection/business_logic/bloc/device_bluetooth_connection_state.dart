part of 'device_bluetooth_connection_bloc.dart';

sealed class DeviceBluetoothConnectionState extends Equatable {
  const DeviceBluetoothConnectionState();

  @override
  List<Object> get props => [];
}

final class DeviceBluetoothConnectionInitial
    extends DeviceBluetoothConnectionState {}

final class DeviceBluetoothConnectionLoading
    extends DeviceBluetoothConnectionState {}

final class DeviceBluetoothConnectionConnectOn
    extends DeviceBluetoothConnectionState {}

final class DeviceBluetoothConnectionSuccess
    extends DeviceBluetoothConnectionState {}

final class DeviceBluetoothConnectionFailure
    extends DeviceBluetoothConnectionState {
  const DeviceBluetoothConnectionFailure({
    required this.error,
  });

  final Exception error;

  @override
  String toString() {
    return 'ConnectDeviceFailure{error: $error}';
  }

  @override
  List<Object> get props => [error];
}
