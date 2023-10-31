part of 'my_devices_bloc.dart';

sealed class MyDevicesState extends Equatable {
  const MyDevicesState();

  @override
  List<Object> get props => [];
}

final class MyDevicesInitial extends MyDevicesState {}

final class MyDevicesSearching extends MyDevicesState {
  final List<BeeDeviceEntity> devices;

  const MyDevicesSearching(this.devices);

  @override
  List<Object> get props => [devices];
}

final class MyDevicesSuccess extends MyDevicesState {
  final List<BeeDeviceEntity> devices;

  const MyDevicesSuccess(this.devices);

  @override
  List<Object> get props => [devices];
}

final class MyDevicesFailure extends MyDevicesState {
  const MyDevicesFailure();
}

final class MyDevicesEmpty extends MyDevicesState {
  const MyDevicesEmpty();
}
