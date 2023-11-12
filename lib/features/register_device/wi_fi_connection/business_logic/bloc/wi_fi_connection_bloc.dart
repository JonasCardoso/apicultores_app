import 'dart:async';

import 'package:apicultores_app/features/register_device/wi_fi_connection/business_logic/use_case/wi_fi_connection_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wi_fi_connection_event.dart';
part 'wi_fi_connection_state.dart';

class WiFiConnectionBloc
    extends Bloc<WiFiConnectionEvent, WiFiConnectionState> {
  WiFiConnectionBloc(this._useCase) : super(WiFiConnectionFinding()) {
    on<WiFiConnectionFetched>(_onFetched);
    on<WiFiConnectionTurnedOn>(_onConnected);
    on<WiFiConnectionTurnedOff>(_onDisconnected);
    on<WiFiLocationSettingsOpened>(_onLocationSettingsOpened);
    on<WiFiLocationPermissionAsked>(_onLocationPermissionAsked);
  }
  final WiFiConnectionUseCase _useCase;

  StreamSubscription<bool>? _wiFiConnectivityListener;

  void _onFetched(
      WiFiConnectionFetched event, Emitter<WiFiConnectionState> emit) async {
    if (!await _useCase.isConnectedToWifi()) {
      emit(WiFiConnectionOff());
    }
    if (!await _useCase.isLocationPermitted()) {
      emit(WiFiLocationNeedsPermission());
      return;
    }
    _wiFiConnectivityListener ??=
        _useCase.isConnectedToWifiStream.listen((isConnected) {
      if (isConnected) {
        add(WiFiConnectionTurnedOn());
      } else {
        add(WiFiConnectionTurnedOff());
      }
    });
  }

  void _onConnected(
    WiFiConnectionTurnedOn event,
    Emitter<WiFiConnectionState> emit,
  ) async {
    emit(WiFiConnectionLoadingInformation());
    try {
      final wiFiName = await _useCase.getWiFiName();
      emit(WiFiConnectionSuccess(wiFiName: wiFiName));
    } on Exception catch (e) {
      print("error: $e");
      emit(WiFiConnectionFailure(error: e));
    }
  }

  void _onDisconnected(
    WiFiConnectionTurnedOff event,
    Emitter<WiFiConnectionState> emit,
  ) async {
    emit(WiFiConnectionOff());
  }

  void _onLocationSettingsOpened(
    WiFiLocationSettingsOpened event,
    Emitter<WiFiConnectionState> emit,
  ) async {
    await _useCase.openLocationSettings();
    add(WiFiConnectionFetched());
  }

  void _onLocationPermissionAsked(
    WiFiLocationPermissionAsked event,
    Emitter<WiFiConnectionState> emit,
  ) async {
    final doesUserPermitIt = await _useCase.requestLocationPermission();
    if (!doesUserPermitIt) {
      emit(WiFiLocationPermissionDeny());
    } else {
      add(WiFiConnectionFetched());
    }
  }

  @override
  Future<void> close() {
    _wiFiConnectivityListener?.cancel();
    return super.close();
  }
}
