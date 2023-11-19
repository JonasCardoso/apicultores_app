part of 'bee_device_graph_configurations_bloc.dart';

sealed class BeeDeviceGraphConfigurationsState extends Equatable {
  const BeeDeviceGraphConfigurationsState();

  @override
  List<Object?> get props => [];
}

final class BeeDeviceGraphConfigurationsInitial
    extends BeeDeviceGraphConfigurationsState {}

final class BeeDeviceGraphConfigurationsSuccess
    extends BeeDeviceGraphConfigurationsState {
  final List<SensorType> visibleSensorsData;
  final DateTime startDate;
  final DateTime? endDate;
  final TimeScaleType timeScaleType;

  const BeeDeviceGraphConfigurationsSuccess({
    required this.visibleSensorsData,
    required this.startDate,
    required this.endDate,
    required this.timeScaleType,
  });

  BeeDeviceGraphConfigurationsSuccess copyWith({
    List<SensorType>? visibleSensorsData,
    DateTime? startDate,
    DateTime? Function()? setEndDate,
    TimeScaleType? timeScaleType,
  }) {
    return BeeDeviceGraphConfigurationsSuccess(
      visibleSensorsData: visibleSensorsData ?? this.visibleSensorsData,
      startDate: startDate ?? this.startDate,
      endDate: setEndDate != null ? setEndDate() : endDate,
      timeScaleType: timeScaleType ?? this.timeScaleType,
    );
  }

  @override
  List<Object?> get props => [
        visibleSensorsData,
        startDate,
        endDate,
        timeScaleType,
      ];
}
