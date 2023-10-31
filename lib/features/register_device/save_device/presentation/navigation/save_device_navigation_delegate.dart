import 'package:flutter_modular/flutter_modular.dart';

class SaveDeviceNavigationDelegate {
  const SaveDeviceNavigationDelegate();

  Future<Map<String, dynamic>?> navigateToPickLocation() {
    return Modular.to.pushNamed('/pick-location');
  }

  void navigateToDevices() {
    Modular.to.navigate('/');
  }
}
