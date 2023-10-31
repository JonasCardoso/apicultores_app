part of 'location_picker_bloc.dart';

sealed class LocationPickerState extends Equatable {
  const LocationPickerState();

  @override
  List<Object> get props => [];
}

final class LocationPickerInitial extends LocationPickerState {}

final class LocationPickerCurrentLocationDeniedForever
    extends LocationPickerState {}

final class LocationPickerLoading extends LocationPickerState {}

final class LocationPickerCurrentLocationSuccess extends LocationPickerState {
  final double latitude;
  final double longitude;

  const LocationPickerCurrentLocationSuccess({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object> get props => [
        latitude,
        longitude,
      ];
}
