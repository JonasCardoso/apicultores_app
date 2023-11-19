import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc_repository.dart';
import 'package:apicultores_app/features/devices/my_devices/data/data_sources/bee_device_connection_data_source.dart';
import 'package:apicultores_app/features/devices/my_devices/data/data_sources/bee_device_local_data_source.dart';
import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';
import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_configurations_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/use_cases/bee_device_graph_use_case.dart';
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
      BlocProvider<BeeDeviceGraphBloc>(
        create: (_) => BeeDeviceGraphBloc(
          BeeDeviceGraphUseCase(
            BeeDeviceRepository(
              beeDeviceConnectionDataSource: BeeDeviceConnectionDataSource(),
              beeDeviceLocalDataSource: BeeDeviceLocalDataSource(),
            ),
          ),
        ),
      ),
      BlocProvider<BeeDeviceGraphConfigurationsBloc>(
        create: (_) => BeeDeviceGraphConfigurationsBloc()
          ..add(
            const BeeDeviceGraphConfigurationsFetched(),
          ),
      ),
    ], child: child);
  }
}
