import 'package:apicultores_app/di/app_composition_root.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/internet_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesBlocProvider extends StatelessWidget {
  const DevicesBlocProvider({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MyDevicesBloc>.value(
        value: AppCompositionRoot().makeMyDevicesBloc()
          ..add(const MyDevicesLocalFetched()),
      ),
      BlocProvider<InternetDevicesBloc>.value(
        value: AppCompositionRoot().makeInternetDevicesBloc(),
      ),
    ], child: child);
  }
}
