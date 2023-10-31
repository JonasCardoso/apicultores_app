import 'package:apicultores_app/features/services/location_picker/data/repository/location_picker_repository.dart';

class LocationPickerUseCase {
  final LocationPickerRepository _locationPickerRepository;

  LocationPickerUseCase(this._locationPickerRepository);

  Future<bool> isLocationServiceEnabled() =>
      _locationPickerRepository.isLocationServiceEnabled();

  Future<void> getCurrentPosition({
    required void Function(
      double latitude,
      double longitude,
    ) onPermissionGranted,
    required void Function() onPermissionDeniedForever,
    required void Function() onPermissionDenied,
  }) =>
      _locationPickerRepository.getCurrentPosition(
        onPermissionGranted: onPermissionGranted,
        onPermissionDeniedForever: onPermissionDeniedForever,
        onPermissionDenied: onPermissionDenied,
      );

  Future<bool> requestPermission() =>
      _locationPickerRepository.requestPermission();

  Future<void> openAppSettings() => _locationPickerRepository.openAppSettings();
}
