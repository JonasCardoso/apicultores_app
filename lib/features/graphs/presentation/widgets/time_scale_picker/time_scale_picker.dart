import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_configurations_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/time_scale_type.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeScalePicker extends StatefulWidget {
  const TimeScalePicker({super.key});

  @override
  State<TimeScalePicker> createState() => _TimeScalePickerState();
}

class _TimeScalePickerState extends State<TimeScalePicker>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    final configurationsState =
        context.read<BeeDeviceGraphConfigurationsBloc>().state;
    final initialTimeScale =
        configurationsState is BeeDeviceGraphConfigurationsSuccess
            ? configurationsState.timeScaleType
            : TimeScaleType.values.first;
    final initialIndex = TimeScaleType.values.indexOf(initialTimeScale);
    _tabController = TabController(
      length: TimeScaleType.values.length,
      vsync: this,
      initialIndex: initialIndex,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<BeeDeviceGraphConfigurationsBloc>().add(
              BeeDeviceGraphConfigurationsTimeScaleChanged(
                timeScale: TimeScaleType.values[_tabController.index],
              ),
            );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.large,
      ),
      child: TabBar(
          splashFactory: NoSplash.splashFactory,
          indicator: BoxDecoration(
            color: SurfaceColor.primaryPallete.shade200,
            borderRadius: BorderRadius.circular(100),
          ),
          controller: _tabController,
          tabs: TimeScaleType.values
              .map((timeScale) => Tab(
                    text: timeScale.iconName,
                  ))
              .toList()),
    );
  }
}
