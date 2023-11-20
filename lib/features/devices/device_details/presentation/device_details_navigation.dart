import 'package:flutter_modular/flutter_modular.dart';

class DeviceDetailsNavigation {
  Future<Map<String, dynamic>?> navigateToPickLocation() {
    return Modular.to.pushNamed('/pick-location');
  }

  void pop() {
    return Modular.to.pop();
  }
}
