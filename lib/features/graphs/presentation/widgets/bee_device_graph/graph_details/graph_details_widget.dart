import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/bee_device_graph_data_builder.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/graph_details/graph_detail_card.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/graph_information/graph_date_information.dart';
import 'package:design_system/design_system.dart';

class GraphDetailsWidget extends StatelessWidget {
  const GraphDetailsWidget({super.key, required this.graphBuilder});
  final BeeDeviceGraphDataBuilder graphBuilder;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Resumo dos dados',
          style: MyTypography.h3,
        ),
        const SizedBox(
          height: Spacing.small,
        ),
        GraphDateInformationWidget(
          graphDataBuilder: graphBuilder,
        ),
        const SizedBox(
          height: Spacing.large,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final sensor =
                graphBuilder.configurations.visibleSensorsData[index];
            return Column(
              children: [
                GraphDetailCard(
                    sensor: sensor,
                    data: graphBuilder.dataBySelectedPeriod(sensor)),
                const SizedBox(
                  height: Spacing.medium,
                ),
              ],
            );
          },
          itemCount: graphBuilder.configurations.visibleSensorsData.length,
        ),
      ],
    );
  }
}
