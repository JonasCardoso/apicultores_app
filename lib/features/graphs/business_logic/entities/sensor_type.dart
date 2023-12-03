import 'package:design_system/design_system.dart';

enum SensorType {
  internalSound,
  externalSound,
  proximity,
  internalTemperature,
  externalTemperature,
  internalHumidity,
  externalHumidity,
  internalPressure,
  externalPressure,
  internalGas,
  externalGas,
}

extension SensorTypeInfo on SensorType {
  Color get color {
    switch (this) {
      case SensorType.internalSound:
        return const Color.fromARGB(255, 100, 5, 114);
      case SensorType.externalSound:
        return const Color.fromARGB(255, 186, 68, 255);
      case SensorType.proximity:
        return const Color.fromARGB(255, 240, 153, 67);
      case SensorType.internalTemperature:
        return const Color.fromARGB(255, 120, 4, 4);
      case SensorType.externalTemperature:
        return const Color.fromARGB(255, 213, 48, 48);
      case SensorType.internalHumidity:
        return const Color.fromARGB(255, 18, 8, 108);
      case SensorType.externalHumidity:
        return const Color.fromARGB(255, 39, 136, 228);
      case SensorType.internalPressure:
        return const Color.fromARGB(255, 0, 102, 0);
      case SensorType.externalPressure:
        return const Color.fromARGB(255, 0, 204, 0);
      case SensorType.internalGas:
        return const Color.fromARGB(255, 63, 63, 63);
      case SensorType.externalGas:
        return const Color.fromARGB(255, 130, 130, 130);
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
      case SensorType.internalTemperature:
        return 'Temperatura Interna';
      case SensorType.externalTemperature:
        return 'Temperatura Externa';
      case SensorType.internalHumidity:
        return 'Umidade Interna';
      case SensorType.externalHumidity:
        return 'Umidade Externa';
      case SensorType.internalPressure:
        return 'Pressão Interna';
      case SensorType.externalPressure:
        return 'Pressão Externa';
      case SensorType.internalGas:
        return 'Gás Interno';
      case SensorType.externalGas:
        return 'Gás Externo';
    }
  }

  String get unit {
    switch (this) {
      case SensorType.internalSound:
      case SensorType.externalSound:
        return 'dB';
      case SensorType.proximity:
        return '';
      case SensorType.internalTemperature:
      case SensorType.externalTemperature:
        return '°C';
      case SensorType.internalHumidity:
      case SensorType.externalHumidity:
        return '%';
      case SensorType.internalPressure:
      case SensorType.externalPressure:
        return 'hPa';
      case SensorType.internalGas:
      case SensorType.externalGas:
        return 'kΩ';
    }
  }
}
