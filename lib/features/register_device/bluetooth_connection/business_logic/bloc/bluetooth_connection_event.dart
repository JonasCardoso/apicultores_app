part of 'bluetooth_connection_bloc.dart';

sealed class BluetoothConnectionEvent extends Equatable {
  const BluetoothConnectionEvent();

  @override
  List<Object> get props => [];
}

class BluetoothConnectionFetched extends BluetoothConnectionEvent {}

class BluetoothConnectionDeactivated extends BluetoothConnectionEvent {}

class BluetoothConnectionActivated extends BluetoothConnectionEvent {}

class BluetoothConnectionTurnedOn extends BluetoothConnectionEvent {}
