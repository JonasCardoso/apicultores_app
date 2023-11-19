import 'package:apicultores_app/features/graphs/business_logic/entities/sensor_type.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/visible_sensors/sensor_selector.dart';
import 'package:flutter/material.dart';

class BeeDeviceGraphVisibleSensorsWidget extends StatelessWidget {
  const BeeDeviceGraphVisibleSensorsWidget({
    super.key,
    required this.visibleSensors,
    required this.allSensors,
  });
  final List<SensorType> allSensors;
  final List<SensorType> visibleSensors;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      children: allSensors
          .map(
            (sensor) => SensorSelector(
              sensorType: sensor,
              isVisible: visibleSensors.contains(sensor),
            ),
          )
          .toList(),
    );
  }
}
