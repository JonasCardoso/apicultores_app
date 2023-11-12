part of 'internet_devices_bloc.dart';

sealed class InternetDevicesEvent extends Equatable {
  const InternetDevicesEvent();

  @override
  List<Object> get props => [];
}

final class InternetDevicesFetched extends InternetDevicesEvent {
  const InternetDevicesFetched();
}

final class InternetDevicesFound extends InternetDevicesEvent {
  final List<BeeDeviceEntity> devices;

  const InternetDevicesFound(this.devices);

  @override
  List<Object> get props => [devices];
}

final class InternetDevicesFailed extends InternetDevicesEvent {
  const InternetDevicesFailed();
}

final class InternetDevicesFetchFinished extends InternetDevicesEvent {
  const InternetDevicesFetchFinished();
}
