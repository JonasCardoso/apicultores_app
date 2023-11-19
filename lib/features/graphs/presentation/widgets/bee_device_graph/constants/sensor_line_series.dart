import 'package:apicultores_app/features/graphs/business_logic/entities/time_scale_type.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/constants/sensor_data.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/sensor_type.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SensorLineSeries extends LineSeries<SensorData, String> {
  SensorLineSeries({
    required List<DateTime?> timestamps,
    required List<double?> data,
    required SensorType sensorType,
    required DateTime startDate,
    required DateTime endDate,
    required TimeScaleType timeScale,
  }) : super(
          dataSource: <SensorData>[
            for (int i = 0; i < timestamps.length; i++)
              if (_shouldAddTimestamp(
                timestamp: timestamps[i],
                startDate: startDate,
                endDate: endDate,
              ))
                SensorData(
                  timestamp: timestamps[i],
                  data: data[i],
                )
          ],
          xValueMapper: (SensorData sensorData, _) {
            return _getAxisLabel(
                date: sensorData.timestamp, timeScale: timeScale);
          },
          yValueMapper: (SensorData sensorData, _) {
            return sensorData.data;
          },
          name: sensorType.name,
          color: sensorType.color,
        );
}

bool _shouldAddTimestamp(
    {required DateTime? timestamp,
    required DateTime startDate,
    required DateTime endDate}) {
  return (timestamp?.isAfter(startDate) ?? false) &&
      (timestamp?.isBefore(endDate) ?? false);
}

String? _getAxisLabel(
    {required DateTime? date, required TimeScaleType timeScale}) {
  if (date == null) return null;
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
}
