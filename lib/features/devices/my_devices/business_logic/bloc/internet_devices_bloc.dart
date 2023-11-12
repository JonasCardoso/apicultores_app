import 'dart:async';

import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/use_cases/internet_devices_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'internet_devices_event.dart';
part 'internet_devices_state.dart';

class InternetDevicesBloc
    extends Bloc<InternetDevicesEvent, InternetDevicesState> {
  InternetDevicesBloc(this._useCase) : super(InternetDevicesInitial()) {
    on<InternetDevicesFetched>(_onDevicesFetched);
    on<InternetDevicesFound>(_onDevicesFound);
    on<InternetDevicesFailed>(_onDevicesFailed);
    on<InternetDevicesFetchFinished>(_onFetchFinished);
  }
  final InternetDevicesUseCase _useCase;
  StreamSubscription<List<BeeDeviceEntity>>? _devicesSubscription;

  void _onDevicesFetched(
      InternetDevicesFetched event, Emitter<InternetDevicesState> emit) async {
    emit.call(
      const InternetDevicesSearching(
        internetDevices: <BeeDeviceEntity>[],
      ),
    );
    _addDevicesInternetSearchingListener();
  }

  void _onDevicesFound(
      InternetDevicesFound event, Emitter<InternetDevicesState> emit) {
    emit.call(
      InternetDevicesSearching(
        internetDevices: event.devices,
      ),
    );
  }

  void _onDevicesFailed(
      InternetDevicesFailed event, Emitter<InternetDevicesState> emit) {
    emit.call(
      const InternetDevicesFailure(),
    );
  }

  void _onFetchFinished(
      InternetDevicesFetchFinished event, Emitter<InternetDevicesState> emit) {
    final currentState = state;
    if (currentState is InternetDevicesSearching) {
      emit.call(
        InternetDevicesSuccess(
          internetDevices: currentState.internetDevices,
        ),
      );
    }
  }

  void _addDevicesInternetSearchingListener() {
    _devicesSubscription ??= _useCase.findDevices().listen((devices) {
      add(
        InternetDevicesFound(
          devices,
        ),
      );
    }, onDone: () {
      _devicesSubscription?.cancel();
      _devicesSubscription = null;
      add(
        const InternetDevicesFetchFinished(),
      );
    }, onError: (error, stk) {
      print('error: $error, stackTrace: $stk');
      add(
        const InternetDevicesFailed(),
      );
    });
  }

  @override
  Future<void> close() {
    _devicesSubscription?.cancel();
    return super.close();
  }
}
