import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/graphs/presentation/navigation/graphs_navigation.dart';
import 'package:apicultores_app/features/graphs/presentation/screens/state_screens/graphs_failure_screen.dart';
import 'package:apicultores_app/features/graphs/presentation/screens/state_screens/graphs_success_screen.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphsScreenBuilder extends StatelessWidget {
  const GraphsScreenBuilder({
    super.key,
    required this.navigation,
  });
  final GraphsNavigation navigation;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDevicesBloc, MyDevicesState>(
        builder: (context, state) {
      return switch (state) {
        MyDevicesLoading _ ||
        MyDevicesInitial _ =>
          const Center(child: CircularProgressIndicator()),
        MyDevicesSuccess state => GraphsSuccessScreen(
            connectedDevices: state.devices
                .where(
                  (device) => device.status == LocalBeeDeviceStatus.connected,
                )
                .toList(),
            navigation: navigation,
          ),
        MyDevicesFailure _ => const GraphsFailureScreen(),
      };
    });
  }
}
