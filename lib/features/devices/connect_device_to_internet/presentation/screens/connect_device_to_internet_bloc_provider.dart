import 'package:apicultores_app/features/devices/connect_device_to_internet/business_logic/use_cases/connect_device_to_internet_use_case.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/data/data_sources/connectivity_data_source.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/data/data_sources/network_info_data_source.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/data/repositories/available_wi_fi_repository.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/bloc/connect_device_to_internet_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceToInternetBlocProvider extends StatelessWidget {
  const ConnectDeviceToInternetBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectDeviceToInternetBloc>(
      create: (_) => ConnectDeviceToInternetBloc(
        ConnectDeviceToInternetUseCase(
          AvailableWiFiRepository(
            connectivityDataSource: ConnectivityDataSource(),
            networkPlusDataSource: NetworkInfoDataSource(),
          ),
        ),
      )..add(ConnectDeviceToInternetFetched()),
      child: child,
    );
  }
}
