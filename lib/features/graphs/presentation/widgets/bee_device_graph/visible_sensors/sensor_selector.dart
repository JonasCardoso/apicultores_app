import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_configurations_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/sensor_type.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SensorSelector extends StatelessWidget {
  final bool isVisible;
  final SensorType sensorType;
  const SensorSelector({
    super.key,
    required this.isVisible,
    required this.sensorType,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: isVisible,
          checkColor: SurfaceColor.foregroundColor,
          activeColor: sensorType.color,
          shape: const CircleBorder(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(
            color: sensorType.color,
          ),
          onChanged: (isChecked) {
            context.read<BeeDeviceGraphConfigurationsBloc>().add(
                  BeeDeviceGraphConfigurationsVisibilityChanged(
                    sensorType: sensorType,
                    isVisible: isChecked ?? false,
                  ),
                );
          },
        ),
        Container(
          height: 2,
          width: Spacing.medium,
          color: sensorType.color,
        ),
        const SizedBox(
          width: Spacing.small,
        ),
        Text(
          sensorType.name,
          style: MyTypography.captionRegular,
        ),
      ],
    );
  }
}
