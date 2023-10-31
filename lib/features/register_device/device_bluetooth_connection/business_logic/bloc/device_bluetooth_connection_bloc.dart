import 'dart:async';

import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'device_bluetooth_connection_event.dart';
part 'device_bluetooth_connection_state.dart';

class DeviceBluetoothConnectionBloc extends Bloc<DeviceBluetoothConnectionEvent,
    DeviceBluetoothConnectionState> {
  DeviceBluetoothConnectionBloc(this._deviceEntity)
      : super(DeviceBluetoothConnectionInitial()) {
    on<DeviceBluetoothConnectionStarted>(_onConnectDeviceStarted);
    on<DeviceBluetoothConnectionConnected>(_onConnectDeviceConnected);
    on<DeviceBluetoothConnectionListened>(_onConnectDeviceListened);
    on<DeviceBluetoothConnectionDisconnected>(_onConnectDeviceDisconnected);
    on<DeviceBluetoothConnectionFailureAdded>(_onConnectDeviceFailure);
  }

  StreamSubscription<bool>? _connectionSubscription;

  final BluetoothDeviceEntity _deviceEntity;

  void _onConnectDeviceListened(DeviceBluetoothConnectionListened event,
      Emitter<DeviceBluetoothConnectionState> emit) async {
    _connectionSubscription ??=
        _deviceEntity.isConnectStream.listen((isConnected) {
      if (isConnected) {
        add(DeviceBluetoothConnectionConnected());
      } else {
        add(DeviceBluetoothConnectionDisconnected());
      }
    });
  }

  void _onConnectDeviceFailure(DeviceBluetoothConnectionFailureAdded event,
      Emitter<DeviceBluetoothConnectionState> emit) {
    emit.call(
      DeviceBluetoothConnectionFailure(error: event.error),
    );
  }

  void _onConnectDeviceDisconnected(DeviceBluetoothConnectionDisconnected event,
      Emitter<DeviceBluetoothConnectionState> emit) {
    emit.call(DeviceBluetoothConnectionInitial());
  }

  void _onConnectDeviceStarted(DeviceBluetoothConnectionStarted event,
      Emitter<DeviceBluetoothConnectionState> emit) async {
    emit.call(DeviceBluetoothConnectionLoading());
    try {
      await _deviceEntity.connect(
        timeout: const Duration(
          seconds: 45,
        ),
      );
    } on Exception catch (error) {
      emit.call(DeviceBluetoothConnectionFailure(error: error));
    }
  }

  void _onConnectDeviceConnected(DeviceBluetoothConnectionConnected event,
      Emitter<DeviceBluetoothConnectionState> emit) async {
    if (state is DeviceBluetoothConnectionLoading) {
      emit.call(DeviceBluetoothConnectionSuccess());
    } else {
      emit.call(DeviceBluetoothConnectionConnectOn());
    }
  }

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();
    return super.close();
  }
}
