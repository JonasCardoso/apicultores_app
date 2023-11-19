import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_bloc.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/bee_device_graph/bee_device_success_graph_widget.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/time_scale_picker/time_scale_picker.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BeeDeviceGraphWidgetBuilder extends StatelessWidget {
  const BeeDeviceGraphWidgetBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeeDeviceGraphBloc, BeeDeviceGraphState>(
      builder: (context, state) {
        if (state is BeeDeviceGraphSuccess) {
          return Column(
            children: [
              const TimeScalePicker(),
              const SizedBox(
                height: Spacing.medium,
              ),
              BeeDeviceSuccessGraphWidget(
                graphData: state.data,
                properties: state.properties,
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
