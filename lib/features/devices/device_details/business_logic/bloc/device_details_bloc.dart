import 'package:apicultores_app/features/devices/device_details/business_logic/use_case/device_details_use_case.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'device_details_event.dart';
part 'device_details_state.dart';

class DeviceDetailsBloc extends Bloc<DeviceDetailsEvent, DeviceDetailsState> {
  DeviceDetailsBloc(this._useCase) : super(DeviceDetailsInitial()) {
    on<DeviceDetailsUpdated>(_onUpdated);
    on<DeviceDetailsRemoved>(_onRemoved);
    on<DeviceDetailsDataCleared>(_onDataCleared);
    on<DeviceDetailsDisconnected>(_onDisconnected);
  }

  final DeviceDetailsUseCase _useCase;

  void _onUpdated(
    DeviceDetailsUpdated event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    try {
      emit(DeviceDetailsLoading());
      await _useCase.updateDevice(event.device);
      emit(DeviceDetailsUpdateSuccess());
    } catch (e) {
      emit(DeviceDetailsUpdateFailure());
    }
  }

  void _onRemoved(
    DeviceDetailsRemoved event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    try {
      emit(DeviceDetailsLoading());
      await _useCase.deleteDevice();
      emit(DeviceDetailsRemoveSucces());
    } catch (e) {
      emit(DeviceDetailsRemoveFailure());
    }
  }

  void _onDataCleared(
    DeviceDetailsDataCleared event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    try {
      emit(DeviceDetailsLoading());
      await _useCase.clearData();
      emit(DeviceDetailsDataClearedSuccess());
    } catch (e) {
      emit(DeviceDetailsDataClearedFailure());
    }
  }

  void _onDisconnected(
    DeviceDetailsDisconnected event,
    Emitter<DeviceDetailsState> emit,
  ) async {
    try {
      emit(DeviceDetailsLoading());
      await _useCase.disconnect();
      emit(DeviceDetailsDisconnectSuccess());
    } catch (e) {
      emit(DeviceDetailsDisconnectFailure());
    }
  }
}
