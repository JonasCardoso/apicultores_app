import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc_repository.dart';
import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_configurations_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraphsBlocProvider extends StatelessWidget {
  const GraphsBlocProvider({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MyDevicesBloc>.value(
        value: MyDevicesBlocRepository().myDevicesBloc,
      ),
      BlocProvider<BeeDeviceGraphBloc>.value(
        value: MyDevicesBlocRepository().beeDeviceGraphBloc,
      ),
      BlocProvider<BeeDeviceGraphConfigurationsBloc>.value(
        value: MyDevicesBlocRepository().beeDeviceGraphConfigurationsBloc,
      ),
    ], child: child);
  }
}
