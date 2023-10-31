import 'dart:async';

import 'package:apicultores_app/features/register_device/find_new_devices/business_logic/use_case/find_new_devices_use_case.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'find_new_devices_event.dart';
part 'find_new_devices_state.dart';

class FindNewDevicesBloc
    extends Bloc<FindNewDevicesEvent, FindNewDevicesState> {
  FindNewDevicesBloc(this._findNewDevicesUseCase)
      : super(FindNewDevicesInitial()) {
    on<FindNewDevicesScanStarted>(_onBluetoothScanStarted);
    on<FindNewDevicesFound>(_onBluetoothDevicesFound);
    on<FindNewDevicesSearchStopped>(_onBluetoothDevicesStopped);
  }

  final FindNewDevicesUseCase _findNewDevicesUseCase;
  StreamSubscription<List<BluetoothDeviceEntity>>? _scanResultsSubscription;
  StreamSubscription<bool>? _scanStatusSubscription;

  void _onBluetoothDevicesFound(
      FindNewDevicesFound event, Emitter<FindNewDevicesState> emit) async {
    emit.call(
      FindNewDevicesSearching(
        event.devices,
      ),
    );
  }

  void _onBluetoothDevicesStopped(FindNewDevicesSearchStopped event,
      Emitter<FindNewDevicesState> emit) async {
    emit.call(
      FindNewDevicesStopSearch(
        scanResults: event.devices,
      ),
    );
  }

  void _onBluetoothScanStarted(FindNewDevicesScanStarted event,
      Emitter<FindNewDevicesState> emit) async {
    try {
      emit.call(
        const FindNewDevicesSearching(
          [],
        ),
      );
      await _findNewDevicesUseCase.startScan(
        const Duration(
          seconds: 10,
        ),
      );
      _initializeScanResultsListener();
    } on Exception catch (error) {
      emit.call(
        FindNewDevicesFailure(
          error: error,
        ),
      );
    }
  }

  void _initializeScanResultsListener() {
    _scanResultsSubscription ??=
        _findNewDevicesUseCase.scanResults.listen((scanResults) {
      add(
        FindNewDevicesFound(
          devices: scanResults,
        ),
      );
    });
    _scanStatusSubscription ??= _findNewDevicesUseCase.isScanning.listen(
      (isScanning) {
        if (!isScanning) {
          add(
            FindNewDevicesSearchStopped(
              devices: state is FindNewDevicesSearching
                  ? (state as FindNewDevicesSearching).scanResults
                  : [],
            ),
          );
        }
      },
    );
  }

  @override
  Future<void> close() {
    _scanResultsSubscription?.cancel();
    _scanStatusSubscription?.cancel();
    return super.close();
  }
}
