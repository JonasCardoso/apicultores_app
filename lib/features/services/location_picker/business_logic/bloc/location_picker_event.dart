part of 'location_picker_bloc.dart';

sealed class LocationPickerEvent extends Equatable {
  const LocationPickerEvent();

  @override
  List<Object> get props => [];
}

final class LocationPickerCurrentLocationAsked extends LocationPickerEvent {}

final class LocationPickerAppSettingsNavigated extends LocationPickerEvent {}

final class LocationPickerCurrentLocationGranted extends LocationPickerEvent {
  final double latitude;
  final double longitude;

  const LocationPickerCurrentLocationGranted(
      {required this.latitude, required this.longitude});
}

final class LocationPickerCurrentLocationDeniedEvent
    extends LocationPickerEvent {}

final class LocationPickerCurrentLocationDeniedForeverEvent
    extends LocationPickerEvent {}
