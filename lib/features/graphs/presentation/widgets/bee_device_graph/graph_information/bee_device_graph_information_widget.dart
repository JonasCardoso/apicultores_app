import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/bee_device_graph_data_builder.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/graph_information/graph_time_skiper_widget.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/graph_information/graph_title_and_date.dart';
import 'package:design_system/design_system.dart';

class BeeDeviceGraphInformationWidget extends StatelessWidget {
  const BeeDeviceGraphInformationWidget({
    super.key,
    required this.graphDataBuilder,
  });
  final BeeDeviceGraphDataBuilder graphDataBuilder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GraphTitleAndDate(
              graphDataBuilder: graphDataBuilder,
            ),
          ),
          const SizedBox(
            width: Spacing.large,
          ),
          GraphTimeSkiperWidget(graphDataBuilder: graphDataBuilder),
        ],
      ),
    );
  }
}
