import 'package:apicultores_app/features/devices/find_new_devices/business_logic/use_case/find_new_devices_use_case.dart';
import 'package:apicultores_app/features/devices/find_new_devices/presentation/bloc/find_new_devices_bloc/find_new_devices_bloc.dart';
import 'package:apicultores_app/features/devices/shared/data/data_sources/bluetooth_data_source.dart';
import 'package:apicultores_app/features/devices/find_new_devices/data/repositories/find_new_devices_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindNewDevicesBlocProvider extends StatelessWidget {
  const FindNewDevicesBlocProvider({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FindNewDevicesBloc>(
      create: (context) => FindNewDevicesBloc(
        FindNewDevicesUseCase(
          findNewDevicesRepository: FindNewDevicesRepository(
            bluetoothDataSource: BluetoothDataSource(),
          ),
        ),
      )..add(FindNewDevicesBluetoothStateChecked()),
      child: child,
    );
  }
}
