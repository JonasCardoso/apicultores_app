import 'package:flutter_modular/flutter_modular.dart';

class GraphsNavigation {
  const GraphsNavigation();
  void navigateToDevicesTab() {
    Modular.to.navigate('/devices');
  }
}
