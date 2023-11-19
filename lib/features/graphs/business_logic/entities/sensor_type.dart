import 'package:design_system/design_system.dart';

enum SensorType { internalSound, externalSound, proximity }

extension SensorTypeInfo on SensorType {
  Color get color {
    switch (this) {
      case SensorType.internalSound:
        return Colors.blueAccent;
      case SensorType.externalSound:
        return Colors.redAccent;
      case SensorType.proximity:
        return Colors.orangeAccent;
    }
  }

  String get name {
    switch (this) {
      case SensorType.internalSound:
        return 'Som Interno';
      case SensorType.externalSound:
        return 'Som Externo';
      case SensorType.proximity:
        return 'Proximidade';
    }
  }
}
