part of 'internet_devices_bloc.dart';

sealed class InternetDevicesState extends Equatable {
  const InternetDevicesState();

  @override
  List<Object> get props => [];
}

final class InternetDevicesInitial extends InternetDevicesState {}

final class InternetDevicesSearching extends InternetDevicesState {
  final List<BeeDeviceEntity> internetDevices;
  const InternetDevicesSearching({
    required this.internetDevices,
  });

  @override
  List<Object> get props => [internetDevices];
}

final class InternetDevicesSuccess extends InternetDevicesState {
  final List<BeeDeviceEntity> internetDevices;
  const InternetDevicesSuccess({
    required this.internetDevices,
  });

  @override
  List<Object> get props => [internetDevices];
}

final class InternetDevicesFailure extends InternetDevicesState {
  const InternetDevicesFailure();
}
