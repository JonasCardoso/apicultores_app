import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc_repository.dart';
import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/bloc/bee_device_graph_configurations_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/bloc/export_graph_in_csv_bloc.dart';
import 'package:apicultores_app/features/graphs/business_logic/use_cases/export_graph_in_csv_use_case.dart';
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
      BlocProvider<ExportGraphInCsvBloc>.value(
        value: ExportGraphInCsvBloc(ExportGraphInCsvUseCase()),
      ),
    ], child: child);
  }
}
