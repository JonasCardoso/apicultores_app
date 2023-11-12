part of 'my_devices_bloc.dart';

sealed class MyDevicesState extends Equatable {
  const MyDevicesState();

  @override
  List<Object> get props => [];
}

final class MyDevicesInitial extends MyDevicesState {
  const MyDevicesInitial();
}

final class MyDevicesLoading extends MyDevicesState {
  const MyDevicesLoading();
}

final class MyDevicesSuccess extends MyDevicesState {
  final List<LocalBeeDeviceEntity> devices;
  const MyDevicesSuccess({
    required this.devices,
  });

  @override
  List<Object> get props => [devices];
}

final class MyDevicesFailure extends MyDevicesState {
  const MyDevicesFailure();
}
