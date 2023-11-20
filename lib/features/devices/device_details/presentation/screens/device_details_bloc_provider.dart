import 'package:apicultores_app/di/app_composition_root.dart';
import 'package:apicultores_app/features/devices/device_details/business_logic/bloc/device_details_bloc.dart';
import 'package:apicultores_app/features/devices/device_details/business_logic/use_case/device_details_use_case.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceDetailsBlocProvider extends StatelessWidget {
  const DeviceDetailsBlocProvider({
    super.key,
    required this.beeDeviceEntity,
    required this.child,
  });
  final BeeDeviceEntity beeDeviceEntity;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeviceDetailsBloc>(
      create: (_) => DeviceDetailsBloc(
        DeviceDetailsUseCase(
          beeDeviceRepository: AppCompositionRoot().makeBeeDeviceRepository(),
          beeDeviceEntity: beeDeviceEntity,
        ),
      ),
      child: child,
    );
  }
}
