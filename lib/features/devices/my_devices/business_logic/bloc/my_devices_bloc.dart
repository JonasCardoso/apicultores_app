import 'dart:async';

import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/use_cases/my_devices_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_devices_event.dart';
part 'my_devices_state.dart';

class MyDevicesBloc extends Bloc<MyDevicesEvent, MyDevicesState> {
  MyDevicesBloc(this._useCase) : super(const MyDevicesEmpty()) {
    on<MyDevicesFetched>(_onDevicesFetched);
    on<MyDevicesFound>(_onDevicesFound);
    on<MyDevicesFailed>(_onFailed);
    on<MyDevicesFetchFinished>(_onFetchFinished);
  }
  final MyDevicesUseCase _useCase;

  StreamSubscription<List<BeeDeviceEntity>>? _devicesSubscription;

  void _onDevicesFetched(MyDevicesFetched event, Emitter<MyDevicesState> emit) {
    emit.call(
      const MyDevicesSearching(
        <BeeDeviceEntity>[],
      ),
    );
    _devicesSubscription ??= _useCase.findDevices().listen(
        (devices) => add(
              MyDevicesFound(
                devices,
              ),
            ), onDone: () {
      _devicesSubscription?.cancel();
      _devicesSubscription = null;
      add(
        const MyDevicesFetchFinished(),
      );
    }, onError: (error, stk) {
      print('error: $error, stackTrace: $stk');
      add(
        const MyDevicesFailed(),
      );
    });
  }

  void _onDevicesFound(MyDevicesFound event, Emitter<MyDevicesState> emit) {
    emit.call(
      MyDevicesSearching(
        event.devices,
      ),
    );
  }

  void _onFailed(MyDevicesFailed event, Emitter<MyDevicesState> emit) {
    emit.call(
      const MyDevicesFailure(),
    );
  }

  void _onFetchFinished(
      MyDevicesFetchFinished event, Emitter<MyDevicesState> emit) {
    final currentState = state;
    if (currentState is MyDevicesSearching) {
      if (currentState.devices.isEmpty) {
        emit.call(
          const MyDevicesEmpty(),
        );
      } else {
        emit.call(
          MyDevicesSuccess(
            currentState.devices,
          ),
        );
      }
    }
  }

  @override
  Future<void> close() {
    _devicesSubscription?.cancel();
    return super.close();
  }
}
