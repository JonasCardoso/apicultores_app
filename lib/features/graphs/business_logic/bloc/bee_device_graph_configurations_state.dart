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
  final DateTime endDate;
  final DateTime lastDateInGraphData;
  final TimeScaleType timeScaleType;

  const BeeDeviceGraphConfigurationsSuccess({
    required this.visibleSensorsData,
    required this.startDate,
    required this.endDate,
    required this.timeScaleType,
    required this.lastDateInGraphData,
  });

  BeeDeviceGraphConfigurationsSuccess copyWith(
      {List<SensorType>? visibleSensorsData,
      DateTime? startDate,
      DateTime? endDate,
      TimeScaleType? timeScaleType,
      DateTime? lastDateInGraphData}) {
    return BeeDeviceGraphConfigurationsSuccess(
      visibleSensorsData: visibleSensorsData ?? this.visibleSensorsData,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      timeScaleType: timeScaleType ?? this.timeScaleType,
      lastDateInGraphData: lastDateInGraphData ?? this.lastDateInGraphData,
    );
  }

  @override
  List<Object?> get props => [
        visibleSensorsData,
        startDate,
        endDate,
        timeScaleType,
        lastDateInGraphData,
      ];
}
