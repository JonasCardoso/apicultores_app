part of 'device_details_bloc.dart';

sealed class DeviceDetailsEvent extends Equatable {
  const DeviceDetailsEvent();

  @override
  List<Object> get props => [];
}

final class DeviceDetailsUpdated extends DeviceDetailsEvent {
  final BeeDeviceEntity device;

  const DeviceDetailsUpdated({
    required this.device,
  });
}

final class DeviceDetailsRemoved extends DeviceDetailsEvent {
  const DeviceDetailsRemoved();
}
