import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_period_entity.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/graph_properties_entity.dart';
import 'package:apicultores_app/features/graphs/data/dtos/graph_period_dto.dart';
import 'package:apicultores_app/features/graphs/presentation/constants/period_picker_const.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/graph_selector/graphs_devices_carousel.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/period_picker/custom_period_picker.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/period_picker/period_picker_carousel.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphsDeviceSelection extends StatefulWidget {
  const GraphsDeviceSelection({
    super.key,
    required this.connectedDevices,
  });
  final List<LocalBeeDeviceEntity> connectedDevices;

  @override
  State<GraphsDeviceSelection> createState() => _GraphsDeviceSelectionState();
}

class _GraphsDeviceSelectionState extends State<GraphsDeviceSelection> {
  late LocalBeeDeviceEntity _selectedDevice = widget.connectedDevices.first;
  late PeriodData? _periodPicker = PeriodData.lastWeek;
  GraphPeriodEntity? _graphPeriod;
  @override
  Widget build(BuildContext context) {
    final selectedDevice = _selectedDevice;
    final periodPicker = _periodPicker;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: Spacing.large,
        ),
        const _QuestionWidget(
          text: 'Dispositivo:',
        ),
        GraphsDevicesCarousel(
            localDevices: widget.connectedDevices,
            selectedDevice: _selectedDevice,
            onDeviceSelected: (device) {
              setState(() {
                _selectedDevice = device;
              });
            }),
        const SizedBox(
          height: Spacing.small,
        ),
        const _QuestionWidget(
          text: 'Período de coleta:',
        ),
        PeriodPickerCarousel(
          selectedDate: _periodPicker,
          onPeriodChanged: (selectedDate) {
            setState(() {
              _periodPicker = selectedDate;
              _graphPeriod = null;
            });
          },
        ),
        const SizedBox(
          height: Spacing.medium,
        ),
        CustomPeriodPicker(
            periodData: _periodPicker,
            graphPeriod: _graphPeriod,
            onPeriodChanged: (graphPeriod) {
              setState(() {
                _graphPeriod = graphPeriod;
                _periodPicker = null;
              });
            }),
        const SizedBox(
          height: Spacing.medium,
        ),
        if (periodPicker != null || _graphPeriod != null)
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.large,
            ),
            child: Button(
              label: "Coletar dados",
              fill: true,
              onPressed: () {
                final period = periodPicker != null
                    ? periodPicker.graphPeriod
                    : _graphPeriod!;
                if (period.isValid) {
                  if (period.canBeCollected) {
                    context.read<BeeDeviceGraphBloc>().add(
                          BeeDeviceGraphFetched(
                            properties: GraphPropertiesEntity(
                              device: selectedDevice.device,
                              period: period,
                            ),
                          ),
                        );
                  } else {
                    const SnackBar(
                            message: "Escolha um período menor que 1 ano",
                            variant: SnackBarVariant.warning)
                        .show(context);
                  }
                } else {
                  const SnackBar(
                          message: "Escolha uma data válida",
                          variant: SnackBarVariant.warning)
                      .show(context);
                }
              },
            ),
          )
      ],
    );
  }
}

class _QuestionWidget extends StatelessWidget {
  const _QuestionWidget({required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.large,
      ),
      child: Column(
        children: [
          Text(
            text,
            style: MyTypography.bodyStrong,
          ),
          const SizedBox(
            height: Spacing.small,
          ),
        ],
      ),
    );
  }
}
