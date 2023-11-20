import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphsDeviceSelectionFailureWidget extends StatelessWidget {
  const GraphsDeviceSelectionFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.large,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: Spacing.large,
          ),
          Text(
            "Algo deu errado ao pesquisar os dados...",
            style: MyTypography.bodyRegular,
          ),
          const SizedBox(
            height: Spacing.medium,
          ),
          Button(
            label: "Tentar novamente",
            fill: true,
            variant: ButtonVariant.outlined,
            onPressed: () {
              context
                  .read<BeeDeviceGraphBloc>()
                  .add(const BeeDeviceGraphRestarted());
            },
          ),
        ],
      ),
    );
  }
}
