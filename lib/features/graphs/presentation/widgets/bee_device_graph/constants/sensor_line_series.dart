import 'package:apicultores_app/features/graphs/business_logic/entities/time_scale_type.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/constants/sensor_data.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/sensor_type.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SensorLineSeries extends LineSeries<SensorData, String> {
  SensorLineSeries({super.key, 
    required List<SensorData> data,
    required SensorType sensorType,
    required DateTime startDate,
    required DateTime endDate,
    required TimeScaleType timeScale,
  }) : super(
          dataSource: data,
          xValueMapper: (SensorData sensorData, _) {
            return sensorData.timestampString(timeScale: timeScale);
          },
          yValueMapper: (SensorData sensorData, _) {
            return sensorData.value;
          },
          name: sensorType.name,
          color: sensorType.color,
        );
}
