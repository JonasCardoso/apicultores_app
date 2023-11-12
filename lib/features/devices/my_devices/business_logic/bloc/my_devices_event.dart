part of 'my_devices_bloc.dart';

sealed class MyDevicesEvent extends Equatable {
  const MyDevicesEvent();

  @override
  List<Object> get props => [];
}

final class MyDevicesLocalFetched extends MyDevicesEvent {
  const MyDevicesLocalFetched();
}

final class MyDevicesNewAdded extends MyDevicesEvent {
  final BeeDeviceEntity device;
  const MyDevicesNewAdded({
    required this.device,
  });
}
