import 'dart:async';

import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/business_logic/use_cases/connect_device_to_internet_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connect_device_to_internet_event.dart';
part 'connect_device_to_internet_state.dart';

class ConnectDeviceToInternetBloc
    extends Bloc<ConnectDeviceToInternetEvent, ConnectDeviceToInternetState> {
  ConnectDeviceToInternetBloc(this._useCase)
      : super(ConnectDeviceToInternetInitial(
          _useCase.wiFiName,
        )) {
    on<ConnectDeviceToInternetStarted>(_onConnectionToWiFiStarted);
    on<ConnectDeviceToInternetFailed>(_onConnectionToWiFiFailed);
    on<ConnectDeviceToInternetConnected>(_onConnectionToWiFiConnected);
    on<ConnectDeviceToInternetRetryTapped>(_onConnectionRetry);
  }
  final ConnectDeviceToInternetUseCase _useCase;
  StreamSubscription<String?>? _onIpReceivedStreamSubscription;

  void _onConnectionToWiFiStarted(
    ConnectDeviceToInternetStarted event,
    Emitter<ConnectDeviceToInternetState> emit,
  ) async {
    emit(ConnectDeviceToInternetLoading());
    final onIpReceivedStream = await _useCase.ipValueStream();
    _onIpReceivedStreamSubscription ??=
        onIpReceivedStream.listen((value) async {
      if (value != null) {
        add(ConnectDeviceToInternetConnected(value));
      } else {
        add(const ConnectDeviceToInternetFailed());
      }
    });
    await _useCase.connectToWiFi(
      event.wiFiName,
      event.wiFiPassword,
    );
  }

  void _onConnectionToWiFiConnected(
    ConnectDeviceToInternetConnected event,
    Emitter<ConnectDeviceToInternetState> emit,
  ) async {
    final possibleRegisteredDevice =
        await _useCase.getPossibleRegisteredDevice(event.deviceIp);
    emit(
      ConnectDeviceToInternetSuccess(
        deviceIp: event.deviceIp,
        possibleRegisteredDevice: possibleRegisteredDevice,
      ),
    );

    await _useCase.disconnectBluetoothOfDevice();
  }

  void _onConnectionToWiFiFailed(
    ConnectDeviceToInternetFailed event,
    Emitter<ConnectDeviceToInternetState> emit,
  ) {
    emit(ConnectDeviceToInternetFailure());
  }

  void _onConnectionRetry(
    ConnectDeviceToInternetRetryTapped event,
    Emitter<ConnectDeviceToInternetState> emit,
  ) {
    emit(ConnectDeviceToInternetInitial(_useCase.wiFiName));
  }

  @override
  Future<void> close() {
    _onIpReceivedStreamSubscription?.cancel();
    return super.close();
  }
}
