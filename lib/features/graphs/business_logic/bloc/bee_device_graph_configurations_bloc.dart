import 'package:apicultores_app/features/graphs/business_logic/entities/sensor_type.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/time_scale_type.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bee_device_graph_configurations_event.dart';
part 'bee_device_graph_configurations_state.dart';

class BeeDeviceGraphConfigurationsBloc extends Bloc<
    BeeDeviceGraphConfigurationsEvent, BeeDeviceGraphConfigurationsState> {
  BeeDeviceGraphConfigurationsBloc()
      : super(BeeDeviceGraphConfigurationsInitial()) {
    on<BeeDeviceGraphConfigurationsFetched>(_onFetched);
    on<BeeDeviceGraphConfigurationsVisibilityChanged>(
        _onSensorVisibilityChanged);
    on<BeeDeviceGraphConfigurationsTimeScaleChanged>(_onTimeScaleChanged);
    on<BeeDeviceGraphConfigurationsIntervalChanged>(_onIntervalChanged);
  }

  void _onFetched(
    BeeDeviceGraphConfigurationsFetched event,
    Emitter<BeeDeviceGraphConfigurationsState> emit,
  ) async {
    emit(
      BeeDeviceGraphConfigurationsSuccess(
        visibleSensorsData: SensorType.values.toList(),
        timeScaleType: TimeScaleType.hour,
        startDate: TimeScaleType.hour.startDuration(DateTime.now()),
        endDate: null,
      ),
    );
  }

  void _onSensorVisibilityChanged(
    BeeDeviceGraphConfigurationsVisibilityChanged event,
    Emitter<BeeDeviceGraphConfigurationsState> emit,
  ) async {
    final currentState = state;
    if (currentState is BeeDeviceGraphConfigurationsSuccess) {
      final visibleSensors =
          List<SensorType>.from(currentState.visibleSensorsData);
      if (event.isVisible) {
        visibleSensors.add(event.sensorType);
      } else {
        visibleSensors.remove(event.sensorType);
      }
      emit(
        currentState.copyWith(
          visibleSensorsData: visibleSensors,
        ),
      );
    }
  }

  void _onTimeScaleChanged(
    BeeDeviceGraphConfigurationsTimeScaleChanged event,
    Emitter<BeeDeviceGraphConfigurationsState> emit,
  ) async {
    final currentState = state;
    if (currentState is BeeDeviceGraphConfigurationsSuccess) {
      emit(
        currentState.copyWith(
          timeScaleType: event.timeScale,
          startDate: event.timeScale.startDuration(DateTime.now()),
          setEndDate: () => null,
        ),
      );
    }
  }

  void _onIntervalChanged(
    BeeDeviceGraphConfigurationsIntervalChanged event,
    Emitter<BeeDeviceGraphConfigurationsState> emit,
  ) async {
    final currentState = state;
    if (currentState is BeeDeviceGraphConfigurationsSuccess) {
      if (event.plus) {
        DateTime? newEndDate = (currentState.endDate ?? DateTime.now())
            .add(currentState.timeScaleType.durationScale);
        if (newEndDate.isAfter(DateTime.now())) {
          newEndDate = null;
        }
        final newStartDate = currentState.startDate
            .add(currentState.timeScaleType.durationScale);
        emit(
          currentState.copyWith(
              setEndDate: () => newEndDate, startDate: newStartDate),
        );
      } else {
        final currentEndDate = currentState.endDate;
        DateTime? newEndDate = currentEndDate == null
            ? currentState.timeScaleType.startDuration(DateTime.now())
            : currentEndDate.subtract(currentState.timeScaleType.durationScale);
        final newStartDate = currentState.startDate
            .subtract(currentState.timeScaleType.durationScale);
        emit(
          currentState.copyWith(
            setEndDate: () => newEndDate,
            startDate: newStartDate,
          ),
        );
      }
    }
  }
}
