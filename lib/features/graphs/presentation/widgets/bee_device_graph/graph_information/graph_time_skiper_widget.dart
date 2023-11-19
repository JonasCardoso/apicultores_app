import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_configurations_bloc.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/bee_device_graph_data_builder.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphTimeSkiperWidget extends StatelessWidget {
  const GraphTimeSkiperWidget({
    super.key,
    required this.graphDataBuilder,
  });

  final BeeDeviceGraphDataBuilder graphDataBuilder;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icons.chevron_left,
          variant: IconButtonVariant.secondary,
          onPressed: () {
            context.read<BeeDeviceGraphConfigurationsBloc>().add(
                  const BeeDeviceGraphConfigurationsIntervalChanged(
                    plus: false,
                  ),
                );
          },
        ),
        const SizedBox(
          width: Spacing.small,
        ),
        IconButton(
          icon: Icons.today,
          onPressed: () {
            context.read<BeeDeviceGraphConfigurationsBloc>().add(
                  BeeDeviceGraphConfigurationsTimeScaleChanged(
                    timeScale: graphDataBuilder.configurations.timeScaleType,
                  ),
                );
          },
          variant: IconButtonVariant.outlined,
          size: IconButtonSize.small,
        ),
        const SizedBox(
          width: Spacing.small,
        ),
        IconButton(
          onPressed: graphDataBuilder.configurations.endDate == null
              ? null
              : () {
                  context.read<BeeDeviceGraphConfigurationsBloc>().add(
                        const BeeDeviceGraphConfigurationsIntervalChanged(
                          plus: true,
                        ),
                      );
                },
          variant: IconButtonVariant.secondary,
          icon: Icons.chevron_right,
        )
      ],
    );
  }
}
