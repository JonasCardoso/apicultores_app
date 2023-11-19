import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_bloc.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/graph_selector/graphs_device_selection.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/graph_selector/graphs_device_selection_failure_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphsDeviceSelectionWidgetBuilder extends StatelessWidget {
  const GraphsDeviceSelectionWidgetBuilder({
    super.key,
    required this.connectedDevices,
    required this.scrollController,
  });
  final List<LocalBeeDeviceEntity> connectedDevices;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Spacing.large,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Configurações de coleta',
                style: MyTypography.h3,
              ),
              const SizedBox(
                height: Spacing.small,
              ),
              Text(
                'Escolha o dispositivo e o período que deseja ver os dados',
                style: MyTypography.bodyStrong.copyWith(
                  color: TextColor.unspecial,
                ),
              ),
            ],
          ),
        ),
        BlocConsumer<BeeDeviceGraphBloc, BeeDeviceGraphState>(
            listener: (context, state) {
              if (state is BeeDeviceGraphSuccess) {
                _scrollToTop();
              }
            },
            builder: (context, state) => switch (state) {
                  BeeDeviceGraphInitial _ ||
                  BeeDeviceGraphSuccess _ =>
                    GraphsDeviceSelection(
                      connectedDevices: connectedDevices,
                    ),
                  BeeDeviceGraphLoading _ => const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Spacing.large,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  BeeDeviceGraphFailure _ =>
                    const GraphsDeviceSelectionFailureWidget(),
                }),
      ],
    );
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
