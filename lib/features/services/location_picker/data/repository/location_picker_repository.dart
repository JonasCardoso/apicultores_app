import 'package:apicultores_app/features/services/location_picker/data/data_sources/geolocator_data_source.dart';

class LocationPickerRepository {
  //TODO: Implement AutocompleteLocationDataSource with an Google API key
  final GeolocatorDataSource _geolocatorDataSource;

  LocationPickerRepository({required GeolocatorDataSource geolocatorDataSource})
      : _geolocatorDataSource = geolocatorDataSource;

  Future<bool> isLocationServiceEnabled() async {
    return await _geolocatorDataSource.isLocationServiceEnabled();
  }

  Future<bool> isLocationPermitted() async {
    return await _geolocatorDataSource.isLocationPermitted();
  }

  Future<void> getCurrentPosition({
    required void Function(
      double latitude,
      double longitude,
    ) onPermissionGranted,
    required void Function() onPermissionDeniedForever,
    required void Function() onPermissionDenied,
  }) async {
    await _geolocatorDataSource.getCurrentPosition(
      onPermissionGranted: onPermissionGranted,
      onPermissionDeniedForever: onPermissionDeniedForever,
      onPermissionDenied: onPermissionDenied,
    );
  }

  Future<bool> requestPermission() async {
    return await _geolocatorDataSource.requestPermission();
  }

  Future<void> openAppSettings() async {
    await _geolocatorDataSource.openAppSettings();
  }
}
