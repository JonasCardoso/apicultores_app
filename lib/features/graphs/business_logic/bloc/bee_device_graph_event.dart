part of 'bee_device_graph_bloc.dart';

sealed class BeeDeviceGraphEvent extends Equatable {
  const BeeDeviceGraphEvent();

  @override
  List<Object> get props => [];
}

final class BeeDeviceGraphFetched extends BeeDeviceGraphEvent {
  final GraphPropertiesEntity properties;

  const BeeDeviceGraphFetched({
    required this.properties,
  });
}

final class BeeDeviceGraphRestarted extends BeeDeviceGraphEvent {
  const BeeDeviceGraphRestarted();
}
