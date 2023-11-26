import 'package:apicultores_app/di/app_composition_root.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/business_logic/bloc/connect_device_to_internet_bloc.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/business_logic/use_cases/connect_device_to_internet_use_case.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceToInternetBlocProvider extends StatelessWidget {
  const ConnectDeviceToInternetBlocProvider({
    super.key,
    required this.child,
    required this.device,
    required this.wiFiName,
  });
  final Widget child;
  final BluetoothDeviceEntity device;
  final String wiFiName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ConnectDeviceToInternetBloc>(
      create: (_) => ConnectDeviceToInternetBloc(
        ConnectDeviceToInternetUseCase(
          device: device,
          wiFiName: wiFiName,
          beeDeviceRepository: AppCompositionRoot().makeBeeDeviceRepository(),
        ),
      ),
      child: child,
    );
  }
}
