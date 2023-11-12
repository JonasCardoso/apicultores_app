import 'dart:developer';

import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/register_device/save_device/business_logic/use_case/save_device_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'save_device_event.dart';
part 'save_device_state.dart';

class SaveDeviceBloc extends Bloc<SaveDeviceEvent, SaveDeviceState> {
  SaveDeviceBloc(this._useCase) : super(SaveDeviceInitial()) {
    on<SaveDeviceStarted>(onSavingStarted);
  }

  final SaveDeviceUseCase _useCase;

  void onSavingStarted(
    SaveDeviceStarted event,
    Emitter<SaveDeviceState> emit,
  ) async {
    emit.call(SaveDeviceLoading());
    try {
      await _useCase.sendBeeDeviceData(event.beeDeviceEntity);
      await _useCase.saveDeviceLocally(beeDeviceEntity: event.beeDeviceEntity);
      emit.call(SaveDeviceSuccess());
    } on Exception catch (e, stackTrace) {
      print('error: $e, stackTrace: $stackTrace');
      emit.call(
        SaveDeviceFailure(
          beeDeviceEntity: event.beeDeviceEntity,
        ),
      );
    }
  }
}
