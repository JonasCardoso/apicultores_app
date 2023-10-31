import 'package:apicultores_app/features/devices/my_devices/data/data_sources/bee_device_connection_data_source.dart';
import 'package:apicultores_app/features/devices/my_devices/data/repositories/bee_device_repository.dart';
import 'package:apicultores_app/features/register_device/save_device/business_logic/bloc/save_device_bloc.dart';
import 'package:apicultores_app/features/register_device/save_device/business_logic/use_case/save_device_use_case.dart';

import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveDeviceBlocProvider extends StatelessWidget {
  const SaveDeviceBlocProvider({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SaveDeviceBloc>(
      create: (_) => SaveDeviceBloc(
        SaveDeviceUseCase(
          beeDeviceRepository: BeeDeviceRepository(
            beeDeviceConnectionDataSource: BeeDeviceConnectionDataSource(),
          ),
        ),
      ),
      child: child,
    );
  }
}
