import 'package:apicultores_app/features/services/location_picker/business_logic/use_case/location_picker_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_picker_event.dart';
part 'location_picker_state.dart';

class LocationPickerBloc
    extends Bloc<LocationPickerEvent, LocationPickerState> {
  LocationPickerBloc(this._useCase) : super(LocationPickerInitial()) {
    on<LocationPickerCurrentLocationAsked>(_onCurrentLocationAsked);
    on<LocationPickerAppSettingsNavigated>(_onAppSettingsNavigated);
    on<LocationPickerCurrentLocationGranted>(_onCurrentLocationGranted);
    on<LocationPickerCurrentLocationDeniedEvent>(_onCurrentLocationDenied);
    on<LocationPickerCurrentLocationDeniedForeverEvent>(
        _onCurrentLocationDeniedForever);
  }

  final LocationPickerUseCase _useCase;
  Future<void> _onCurrentLocationAsked(
    LocationPickerCurrentLocationAsked event,
    Emitter<LocationPickerState> emit,
  ) async {
    emit(LocationPickerLoading());
    final isAvailable = await _useCase.isLocationServiceEnabled();
    if (isAvailable) {
      await _useCase.getCurrentPosition(
        onPermissionGranted: (latitude, longitude) async {
          add(
            LocationPickerCurrentLocationGranted(
              latitude: latitude,
              longitude: longitude,
            ),
          );
        },
        onPermissionDeniedForever: () {
          add(LocationPickerCurrentLocationDeniedForeverEvent());
        },
        onPermissionDenied: () async {
          add(LocationPickerCurrentLocationDeniedEvent());
        },
      );
    }
  }

  void _onCurrentLocationGranted(
    LocationPickerCurrentLocationGranted event,
    Emitter<LocationPickerState> emit,
  ) async {
    emit(
      LocationPickerCurrentLocationSuccess(
        latitude: event.latitude,
        longitude: event.longitude,
      ),
    );
  }

  void _onCurrentLocationDenied(
    LocationPickerCurrentLocationDeniedEvent event,
    Emitter<LocationPickerState> emit,
  ) async {
    final isGranted = await _useCase.requestPermission();
    if (isGranted) {
      await _onCurrentLocationAsked(
        LocationPickerCurrentLocationAsked(),
        emit,
      );
    } else {
      emit(LocationPickerCurrentLocationDeniedForever());
    }
  }

  void _onCurrentLocationDeniedForever(
    LocationPickerCurrentLocationDeniedForeverEvent event,
    Emitter<LocationPickerState> emit,
  ) async {
    emit(LocationPickerCurrentLocationDeniedForever());
  }

  void _onAppSettingsNavigated(
    LocationPickerAppSettingsNavigated event,
    Emitter<LocationPickerState> emit,
  ) async {
    await _useCase.openAppSettings();
    emit(LocationPickerInitial());
  }
}
