import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_configurations_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_data_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_properties_entity.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/bee_device_graph_data_builder.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/graph_actions/graph_actions_area.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/graph_details/graph_details_widget.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/graph_information/bee_device_graph_information_widget.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/visible_sensors/bee_device_graph_visible_sensors_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BeeDeviceSuccessGraphWidget extends StatelessWidget {
  const BeeDeviceSuccessGraphWidget({
    super.key,
    required this.graphData,
    required this.properties,
  });
  final GraphDataEntity graphData;
  final GraphPropertiesEntity properties;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeeDeviceGraphConfigurationsBloc,
        BeeDeviceGraphConfigurationsState>(builder: (context, state) {
      if (state is BeeDeviceGraphConfigurationsSuccess) {
        final builder = BeeDeviceGraphDataBuilder(
          graphData: graphData,
          properties: properties,
          configurations: state,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BeeDeviceGraphInformationWidget(graphDataBuilder: builder),
            const SizedBox(
              height: Spacing.medium,
            ),
            Container(
              color: SurfaceColor.foregroundColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: Spacing.medium,
                  ),
                  SfCartesianChart(
                    series: builder.buildSeries(),
                    trackballBehavior: builder.buildTrackballBehavior(),
                    primaryXAxis: const CategoryAxis(),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Spacing.medium),
                    child: BeeDeviceGraphVisibleSensorsWidget(
                      allSensors: graphData.data.keys.toList(),
                      visibleSensors: state.visibleSensorsData,
                    ),
                  ),
                  const SizedBox(
                    height: Spacing.medium,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Spacing.xlarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.large,
              ),
              child: GraphDetailsWidget(
                graphBuilder: builder,
              ),
            ),
            const SizedBox(
              height: Spacing.medium,
            ),
            GraphActionsArea(graphData: graphData),
          ],
        );
      }
      return const SfCartesianChart();
    });
  }
}
