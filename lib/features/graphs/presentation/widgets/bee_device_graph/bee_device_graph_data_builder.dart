import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_configurations_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_data_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_properties_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/sensor_type.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/constants/sensor_data.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/constants/sensor_line_series.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BeeDeviceGraphDataBuilder {
  final GraphDataEntity graphData;
  final GraphPropertiesEntity properties;
  final BeeDeviceGraphConfigurationsSuccess configurations;

  const BeeDeviceGraphDataBuilder({
    required this.graphData,
    required this.properties,
    required this.configurations,
  });

  dynamic buildSeries() {
    return <LineSeries<SensorData, String>>[
      for (final sensor in configurations.visibleSensorsData)
        SensorLineSeries(
          data: dataBySelectedPeriod(sensor).reversed.toList(),
          sensorType: sensor,
          startDate: configurations.startDate,
          endDate: configurations.endDate ?? DateTime.now(),
          timeScale: configurations.timeScaleType,
        ),
    ];
  }

  TrackballBehavior buildTrackballBehavior() {
    return TrackballBehavior(
        tooltipAlignment: ChartAlignment.near,
        enable: true,
        activationMode: ActivationMode.singleTap,
        tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
        tooltipSettings: const InteractiveTooltip(
          enable: true,
          format: 'point.y',
        ));
  }

  List<SensorData> dataBySelectedPeriod(SensorType sensor) {
    final data = <SensorData>[];
    for (var i = 0; i < graphData.timestamps.length; i++) {
      final timestamp = graphData.timestamps[i];
      if (_shouldIncludeTimestamp(timestamp: timestamp)) {
        data.add(
          SensorData(
            timestamp: timestamp,
            value: graphData.data[sensor]?[i],
            sensorType: sensor,
          ),
        );
      }
    }
    return data;
  }

  bool _shouldIncludeTimestamp({required DateTime? timestamp}) {
    return (timestamp?.isAfter(configurations.startDate) ?? false) &&
        (timestamp?.isBefore(configurations.endDate ?? DateTime.now()) ??
            false);
  }
}
