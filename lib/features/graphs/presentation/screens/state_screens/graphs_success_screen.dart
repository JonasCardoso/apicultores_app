import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/graphs/presentation/navigation/graphs_navigation.dart';
import 'package:apicultores_app/features/graphs/presentation/screens/state_screens/graphs_empty_devices_screen.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/bee_device_graph_widget_builder.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/graph_selector/graphs_device_selection_widget_builder.dart';
import 'package:design_system/design_system.dart';

class GraphsSuccessScreen extends StatelessWidget {
  const GraphsSuccessScreen({
    super.key,
    required this.connectedDevices,
    required this.navigation,
  });
  final List<LocalBeeDeviceEntity> connectedDevices;
  final GraphsNavigation navigation;
  @override
  Widget build(BuildContext context) {
    if (connectedDevices.isEmpty) {
      return GraphsEmptyDevicesWidget(
        navigation: navigation,
      );
    }
    final scrollController = ScrollController();
    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: AppBar(
                title: 'Dados',
                showBackButton: false,
              ),
            ),
            const SizedBox(
              height: Spacing.medium,
            ),
            const BeeDeviceGraphWidgetBuilder(),
            GraphsDeviceSelectionWidgetBuilder(
              connectedDevices: connectedDevices,
              scrollController: scrollController,
            ),
            const SizedBox(
              height: Spacing.large,
            ),
          ],
        ),
      ),
    );
  }
}
