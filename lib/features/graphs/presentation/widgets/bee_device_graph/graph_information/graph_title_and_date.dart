import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/bee_device_graph_data_builder.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/graph_information/graph_date_information.dart';
import 'package:design_system/design_system.dart';

class GraphTitleAndDate extends StatelessWidget {
  const GraphTitleAndDate({
    super.key,
    required this.graphDataBuilder,
  });
  final BeeDeviceGraphDataBuilder graphDataBuilder;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          graphDataBuilder.properties.device.name,
          style: MyTypography.h3,
        ),
        const SizedBox(
          height: Spacing.small,
        ),
        GraphDateInformationWidget(
          graphDataBuilder: graphDataBuilder,
        ),
        const SizedBox(
          height: Spacing.small,
        ),
      ],
    );
  }
}
