import 'dart:async';

import 'package:apicultores_app/features/register_device/bluetooth_connection/business_logic/use_case/bluetooth_connection_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bluetooth_connection_event.dart';
part 'bluetooth_connection_state.dart';

class BluetoothConnectionBloc
    extends Bloc<BluetoothConnectionEvent, BluetoothConnectionState> {
  BluetoothConnectionBloc(this._useCase) : super(BluetoothConnectionInitial()) {
    on<BluetoothConnectionFetched>(_onFetched);
    on<BluetoothConnectionActivated>(_onActivated);
    on<BluetoothConnectionDeactivated>(_onDeactivated);
    on<BluetoothConnectionTurnedOn>(_onTurnedOn);
  }
  final BluetoothConnectionUseCase _useCase;
  StreamSubscription<bool>? _bluetoothConnectionSubscription;

  void _onFetched(
    BluetoothConnectionFetched event,
    Emitter<BluetoothConnectionState> emit,
  ) async {
    final isBluetoothAvailable = await _useCase.isBluetoothAvailable();
    if (isBluetoothAvailable) {
      _bluetoothConnectionSubscription ??=
          _useCase.isBluetoothTurnedOn.listen((isBluetoothOn) {
        if (isBluetoothOn) {
          add(
            BluetoothConnectionTurnedOn(),
          );
        } else {
          add(
            BluetoothConnectionDeactivated(),
          );
        }
      },
              onError: (_, __) => add(
                    BluetoothConnectionDeactivated(),
                  ));
    } else {
      emit.call(BluetoothConnectionUnavailable());
    }
  }

  void _onActivated(
    BluetoothConnectionActivated event,
    Emitter<BluetoothConnectionState> emit,
  ) async {
    try {
      await _useCase.turnOnBluetooth();
    } on Exception {
      emit.call(
        BluetoothConnectionInactive(),
      );
    }
  }

  void _onTurnedOn(
    BluetoothConnectionTurnedOn event,
    Emitter<BluetoothConnectionState> emit,
  ) async {
    emit(BluetoothConnectionSuccess());
  }

  void _onDeactivated(
    BluetoothConnectionDeactivated event,
    Emitter<BluetoothConnectionState> emit,
  ) async {
    emit(BluetoothConnectionInactive());
  }

  @override
  Future<void> close() {
    _bluetoothConnectionSubscription?.cancel();
    return super.close();
  }
}
