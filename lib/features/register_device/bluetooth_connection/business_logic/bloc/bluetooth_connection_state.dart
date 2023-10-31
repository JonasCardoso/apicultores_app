part of 'bluetooth_connection_bloc.dart';

sealed class BluetoothConnectionState extends Equatable {
  const BluetoothConnectionState();

  @override
  List<Object> get props => [];
}

final class BluetoothConnectionInitial extends BluetoothConnectionState {}

final class BluetoothConnectionInactive extends BluetoothConnectionState {}

final class BluetoothConnectionUnavailable extends BluetoothConnectionState {}

final class BluetoothConnectionSuccess extends BluetoothConnectionState {}
