import 'dart:async';

import 'package:apicultores_app/features/devices/connect_device_to_internet/business_logic/use_cases/connect_device_to_internet_use_case.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/data/exceptions/connect_device_to_internet_exceptions.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connect_device_to_internet_event.dart';
part 'connect_device_to_internet_state.dart';

class ConnectDeviceToInternetBloc
    extends Bloc<ConnectDeviceToInternetEvent, ConnectDeviceToInternetState> {
  ConnectDeviceToInternetBloc(this._useCase)
      : super(ConnectDeviceToInternetFindingWiFi()) {
    on<ConnectDeviceToInternetFetched>(_onFetched);
    on<ConnectDeviceToInternetWiFiTurnedOn>(_onConnected);
    on<ConnectDeviceToInternetWiFiTurnedOff>(_onDisconnected);
  }

  StreamSubscription<bool>? _wiFiConnectivityListener;
  final ConnectDeviceToInternetUseCase _useCase;

  void _onFetched(ConnectDeviceToInternetFetched event,
      Emitter<ConnectDeviceToInternetState> emit) {
    _wiFiConnectivityListener ??=
        _useCase.isConnectedToWifi.listen((isConnected) {
      if (isConnected) {
        add(ConnectDeviceToInternetWiFiTurnedOn());
      } else {
        add(ConnectDeviceToInternetWiFiTurnedOff());
      }
    });
  }

  void _onConnected(ConnectDeviceToInternetWiFiTurnedOn event,
      Emitter<ConnectDeviceToInternetState> emit) async {
    emit(ConnectDeviceToInternetWiFiLoading());
    try {
      final wiFiName = await _useCase.getWiFiName();
      emit(ConnectDeviceToInternetWifiAvailable(wiFiName: wiFiName));
    } on ConnectDeviceToInternetWiFiNotAvailableException catch (_) {
      emit(ConnectDeviceToInternetWiFiFailure());
    } on Exception catch (e) {
      emit(ConnectDeviceToInternetGenericFailure(error: e));
    }
  }

  void _onDisconnected(ConnectDeviceToInternetWiFiTurnedOff event,
      Emitter<ConnectDeviceToInternetState> emit) {
    emit(ConnectDeviceToInternetWiFiOff());
  }

  @override
  Future<void> close() {
    _wiFiConnectivityListener?.cancel();
    return super.close();
  }
}
