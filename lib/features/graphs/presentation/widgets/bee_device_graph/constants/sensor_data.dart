import 'package:apicultores_app/features/graphs/business_logic/entities/sensor_type.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/time_scale_type.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class SensorData extends Equatable {
  final SensorType sensorType;
  final DateTime? timestamp;
  final double? value;

  const SensorData({
    required this.timestamp,
    required this.value,
    required this.sensorType,
  });

  factory SensorData.empty() {
    return const SensorData(
      timestamp: null,
      value: null,
      sensorType: SensorType.proximity,
    );
  }

  String valueToString() {
    return '${value?.toStringAsFixed(2) ?? ''} ${sensorType.unit}';
  }

  String timestampString({TimeScaleType? timeScale}) {
    final date = timestamp;
    if (date != null && timeScale != null) {
      switch (timeScale) {
        case TimeScaleType.hour:
          return DateFormat('HH:mm').format(date);
        case TimeScaleType.day:
          return DateFormat('HH:mm').format(date);
        case TimeScaleType.week:
          return DateFormat('EEE', 'pt_BR').format(date);
        case TimeScaleType.month:
          return DateFormat('dd').format(date);
        case TimeScaleType.year:
          return DateFormat('MMM', 'pt_BR').format(date);
      }
    } else if (date != null) {
      return DateFormat('EEE, d MMM yyyy, HH:mm', 'pt_BR').format(date);
    }
    return '';
  }

  @override
  List<Object?> get props => [
        timestamp,
        value,
      ];
}
