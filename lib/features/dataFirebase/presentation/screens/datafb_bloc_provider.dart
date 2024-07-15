import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc_repository.dart';


class DatafbBlocProvider extends StatelessWidget {
  const DatafbBlocProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    //return const Text("textoooo11111111111");
     return MultiBlocProvider(providers: [
       BlocProvider<MyDevicesBloc>.value(
         value: MyDevicesBlocRepository().myDevicesBloc,
       ),
    //   BlocProvider<BeeDeviceGraphBloc>.value(
    //     value: MyDevicesBlocRepository().beeDeviceGraphBloc,
    //   ),
    //   BlocProvider<BeeDeviceGraphConfigurationsBloc>.value(
    //     value: MyDevicesBlocRepository().beeDeviceGraphConfigurationsBloc,
    //   ),
    //   BlocProvider<ExportGraphInCsvBloc>.value(
    //     value: ExportGraphInCsvBloc(ExportGraphInCsvUseCase()),
    //   ),
     ], child: child);
  }
}