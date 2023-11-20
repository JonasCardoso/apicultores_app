import 'package:apicultores_app/features/devices/device_details/business_logic/bloc/device_details_bloc.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/device_details_navigation.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/widgets/device_details_form_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceDetailsScreenBuilder extends StatelessWidget {
  const DeviceDetailsScreenBuilder({
    super.key,
    required this.device,
    required this.navigation,
  });
  final LocalBeeDeviceEntity device;
  final DeviceDetailsNavigation navigation;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeviceDetailsBloc, DeviceDetailsState>(
      builder: (context, state) {
        return switch (state) {
          DeviceDetailsLoading _ ||
          DeviceDetailsRemoveSucces _ ||
          DeviceDetailsUpdateSuccess _ =>
            const Center(
              child: CircularProgressIndicator(),
            ),
          DeviceDetailsInitial _ ||
          DeviceDetailsUpdateFailure _ ||
          DeviceDetailsRemoveFailure _ =>
            DeviceDetailsFormWidget(
              device: device,
              navigation: navigation,
            ),
        };
      },
      listener: (context, state) {
        if (state is DeviceDetailsUpdateSuccess) {
          navigation.pop();
        }
        if (state is DeviceDetailsRemoveSucces) {
          navigation.pop();
        }
        if (state is DeviceDetailsUpdateFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Não foi possível atualizar o dispositivo'),
            ),
          );
        }
        if (state is DeviceDetailsRemoveFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Não foi possível remover o dispositivo'),
            ),
          );
        }
      },
    );
  }
}
