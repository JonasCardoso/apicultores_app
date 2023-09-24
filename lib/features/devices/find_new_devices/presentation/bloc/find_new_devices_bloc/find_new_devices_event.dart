part of 'find_new_devices_bloc.dart';

sealed class FindNewDevicesEvent extends Equatable {
  const FindNewDevicesEvent();

  @override
  List<Object> get props => [];
}

class FindNewDevicesBluetoothStateChecked extends FindNewDevicesEvent {}

class FindNewDevicesScanStarted extends FindNewDevicesEvent {}

class FindNewDevicesBluetoothDeactivated extends FindNewDevicesEvent {}

class FindNewDevicesBluetoothActivated extends FindNewDevicesEvent {}

class FindNewDevicesFound extends FindNewDevicesEvent {
  const FindNewDevicesFound({
    required this.devices,
  });

  final List<BluetoothDeviceEntity> devices;

  @override
  List<Object> get props => [devices];
}

class FindNewDevicesSearchStopped extends FindNewDevicesEvent {
  const FindNewDevicesSearchStopped({
    required this.devices,
  });

  final List<BluetoothDeviceEntity> devices;

  @override
  List<Object> get props => [devices];
}
