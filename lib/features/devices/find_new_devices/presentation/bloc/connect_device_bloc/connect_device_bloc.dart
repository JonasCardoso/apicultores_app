import 'dart:async';

import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connect_device_event.dart';
part 'connect_device_state.dart';

class ConnectDeviceBloc extends Bloc<ConnectDeviceEvent, ConnectDeviceState> {
  ConnectDeviceBloc(this._deviceEntity) : super(ConnectDeviceInitial()) {
    on<ConnectDeviceStarted>(_onConnectDeviceStarted);
    on<ConnectDeviceConnected>(_onConnectDeviceConnected);
    on<ConnectDeviceListened>(_onConnectDeviceListened);
  }

  StreamSubscription<bool>? _connectionSubscription;

  final BluetoothDeviceEntity _deviceEntity;

  void _onConnectDeviceListened(
      ConnectDeviceListened event, Emitter<ConnectDeviceState> emit) async {
    _connectionSubscription ??=
        _deviceEntity.isConnectStream.listen((isConnected) {
      if (isConnected) {
        add(ConnectDeviceConnected());
      }
    });
  }

  void _onConnectDeviceStarted(
      ConnectDeviceStarted event, Emitter<ConnectDeviceState> emit) async {
    emit.call(ConnectDeviceLoading());
    try {
      await _deviceEntity.connect(
        timeout: const Duration(
          seconds: 45,
        ),
      );
    } on Exception catch (error) {
      emit.call(ConnectDeviceFailure(error: error));
    }
  }

  void _onConnectDeviceConnected(
      ConnectDeviceConnected event, Emitter<ConnectDeviceState> emit) async {
    emit.call(ConnectDeviceSuccess());
  }

  @override
  Future<void> close() {
    _connectionSubscription?.cancel();
    return super.close();
  }
}
