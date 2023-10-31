import 'package:geolocator/geolocator.dart';

class GeolocatorDataSource {
  Future<bool> isLocationServiceEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }

  Future<void> openAppSettings() {
    return Geolocator.openAppSettings();
  }

  Future<void> getCurrentPosition({
    required void Function(
      double latitude,
      double longitude,
    ) onPermissionGranted,
    required void Function() onPermissionDeniedForever,
    required void Function() onPermissionDenied,
  }) {
    return Geolocator.checkPermission().then((permission) async {
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        final position = await Geolocator.getCurrentPosition();
        onPermissionGranted(
          position.latitude,
          position.longitude,
        );
      }
      if (permission == LocationPermission.deniedForever) {
        onPermissionDeniedForever();
      }
      if (permission == LocationPermission.denied) {
        onPermissionDenied();
      }
    });
  }

  Future<bool> requestPermission() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }
    return false;
  }
}
