part of 'my_devices_bloc.dart';

sealed class MyDevicesEvent extends Equatable {
  const MyDevicesEvent();

  @override
  List<Object> get props => [];
}

final class MyDevicesFetched extends MyDevicesEvent {
  const MyDevicesFetched();

  @override
  List<Object> get props => [];
}

final class MyDevicesFound extends MyDevicesEvent {
  final List<BeeDeviceEntity> devices;

  const MyDevicesFound(this.devices);

  @override
  List<Object> get props => [devices];
}

final class MyDevicesFailed extends MyDevicesEvent {
  const MyDevicesFailed();
}

final class MyDevicesFetchFinished extends MyDevicesEvent {
  const MyDevicesFetchFinished();
}
