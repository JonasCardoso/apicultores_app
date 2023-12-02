part of 'bee_device_graph_configurations_bloc.dart';

sealed class BeeDeviceGraphConfigurationsEvent extends Equatable {
  const BeeDeviceGraphConfigurationsEvent();

  @override
  List<Object> get props => [];
}

final class BeeDeviceGraphConfigurationsFetched
    extends BeeDeviceGraphConfigurationsEvent {
  final DateTime lastDateInTimestamp;
  const BeeDeviceGraphConfigurationsFetched({
    required this.lastDateInTimestamp,
  });
}

final class BeeDeviceGraphConfigurationsVisibilityChanged
    extends BeeDeviceGraphConfigurationsEvent {
  final SensorType sensorType;
  final bool isVisible;

  const BeeDeviceGraphConfigurationsVisibilityChanged({
    required this.sensorType,
    required this.isVisible,
  });
}

final class BeeDeviceGraphConfigurationsTimeScaleChanged
    extends BeeDeviceGraphConfigurationsEvent {
  final TimeScaleType timeScale;

  const BeeDeviceGraphConfigurationsTimeScaleChanged({
    required this.timeScale,
  });
}

final class BeeDeviceGraphConfigurationsIntervalChanged
    extends BeeDeviceGraphConfigurationsEvent {
  final bool plus;

  const BeeDeviceGraphConfigurationsIntervalChanged({
    required this.plus,
  });
}
