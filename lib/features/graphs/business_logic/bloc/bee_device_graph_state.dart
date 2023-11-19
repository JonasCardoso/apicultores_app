part of 'bee_device_graph_bloc.dart';

sealed class BeeDeviceGraphState extends Equatable {
  const BeeDeviceGraphState();

  @override
  List<Object> get props => [];
}

final class BeeDeviceGraphInitial extends BeeDeviceGraphState {
  const BeeDeviceGraphInitial();
}

final class BeeDeviceGraphLoading extends BeeDeviceGraphState {
  const BeeDeviceGraphLoading();
}

final class BeeDeviceGraphSuccess extends BeeDeviceGraphState {
  final GraphDataEntity data;
  final GraphPropertiesEntity properties;

  const BeeDeviceGraphSuccess({
    required this.data,
    required this.properties,
  });

  @override
  List<Object> get props => [
        data,
        properties,
      ];
}

final class BeeDeviceGraphFailure extends BeeDeviceGraphState {
  const BeeDeviceGraphFailure();
}
