import 'dart:math' as math;

import 'package:apicultores_app/features/graphs/business_logic/entities/sensor_type.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/constants/sensor_data.dart';
import 'package:design_system/design_system.dart';

class GraphDetailCard extends StatelessWidget {
  const GraphDetailCard({
    super.key,
    required this.sensor,
    required this.data,
  });
  final SensorType sensor;
  final List<SensorData> data;
  @override
  Widget build(BuildContext context) {
    final values = data.map((e) => e.value).whereType<double>().toList();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: SurfaceColor.foregroundColor,
        borderRadius: BorderRadius.circular(Spacing.medium),
      ),
      padding: const EdgeInsets.all(Spacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MyIcon(
                Icons.data_exploration_sharp,
                color: sensor.color,
              ),
              const SizedBox(
                width: Spacing.small,
              ),
              Text(
                sensor.name,
                style: MyTypography.h3,
              ),
            ],
          ),
          const SizedBox(
            height: Spacing.small,
          ),
          Row(
            children: [
              Text(
                'Média:',
                style:
                    MyTypography.bodyStrong.copyWith(color: TextColor.special),
              ),
              const SizedBox(
                width: Spacing.small,
              ),
              Text(
                '${values.isNotEmpty ? (values.reduce((a, b) => a + b) / values.length).toStringAsFixed(2) : '0'} ${sensor.unit}',
                style: MyTypography.bodyRegular,
              )
            ],
          ),
          const SizedBox(
            height: Spacing.large,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MeasurePlaceholder(name: 'Min', data: data.min),
              _MeasurePlaceholder(name: 'Máx', data: data.max),
            ],
          )
        ],
      ),
    );
  }
}

class _MeasurePlaceholder extends StatelessWidget {
  const _MeasurePlaceholder({
    required this.name,
    required this.data,
  });
  final String name;
  final SensorData data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '$name:',
              style:
                  MyTypography.bodyStrong.copyWith(color: TextColor.unspecial),
            ),
            const SizedBox(
              width: Spacing.small,
            ),
            Text(
              data.valueToString(),
              style: MyTypography.h4Regular,
            ),
          ],
        ),
        const SizedBox(
          width: Spacing.small,
        ),
        Text(
          data.timestampString(),
          style: MyTypography.captionRegular.copyWith(
            color: TextColor.unspecial,
          ),
        )
      ],
    );
  }
}

extension on List<SensorData> {
  SensorData get min {
    if (isNotEmpty) {
      final min = map(
        (e) => e.value,
      ).whereType<double>().reduce(math.min);
      return firstWhere((element) => element.value == min);
    }
    return SensorData.empty();
  }

  SensorData get max {
    if (isEmpty) {
      return SensorData.empty();
    }
    final max = map(
      (e) => e.value,
    ).whereType<double>().reduce(math.max);
    return firstWhere((element) => element.value == max);
  }
}
