import 'package:flutter_modular/flutter_modular.dart';

class LocationPickerNavigationDelegate {
  const LocationPickerNavigationDelegate();
  void pop({
    double? latitude,
    double? longitude,
  }) {
    Modular.to.pop(
      {
        'latitude': latitude,
        'longitude': longitude,
      },
    );
  }
}
