import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/use_cases/my_devices_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_devices_event.dart';
part 'my_devices_state.dart';

class MyDevicesBloc extends Bloc<MyDevicesEvent, MyDevicesState> {
  MyDevicesBloc(this._useCase) : super(const MyDevicesInitial()) {
    on<MyDevicesLocalFetched>(_onDevicesLocalFetched);
    on<MyDevicesNewAdded>(_onNewDeviceAdded);
  }
  final MyDevicesUseCase _useCase;

  void _onDevicesLocalFetched(
      MyDevicesLocalFetched event, Emitter<MyDevicesState> emit) async {
    emit.call(const MyDevicesLoading());
    final localDevices = await _useCase.getLocalDevices();
    final localConnectedDevices = <LocalBeeDeviceEntity>[];
    for (var localDevice in localDevices) {
      final isConnected = await _useCase.isLocalDeviceConnected(localDevice);
      localConnectedDevices.add(
        LocalBeeDeviceEntity(
          device: localDevice,
          status: isConnected
              ? LocalBeeDeviceStatus.connected
              : LocalBeeDeviceStatus.disconnected,
        ),
      );
    }
    emit.call(
      MyDevicesSuccess(
        devices: localConnectedDevices,
      ),
    );
  }

  void _onNewDeviceAdded(
      MyDevicesNewAdded event, Emitter<MyDevicesState> emit) async {
    await _useCase.saveDeviceLocally(beeDeviceEntity: event.device);
    add(const MyDevicesLocalFetched());
  }
}
