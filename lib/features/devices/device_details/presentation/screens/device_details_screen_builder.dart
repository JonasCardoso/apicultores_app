import 'package:apicultores_app/features/devices/device_details/business_logic/bloc/device_details_bloc.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/device_details_navigation.dart';
import 'package:apicultores_app/features/devices/device_details/presentation/widgets/device_details_form_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:design_system/design_system.dart';
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
          DeviceDetailsUpdateSuccess _ ||
          DeviceDetailsDataClearedSuccess _ ||
          DeviceDetailsDisconnectSuccess _ =>
            const Center(
              child: CircularProgressIndicator(),
            ),
          DeviceDetailsInitial _ ||
          DeviceDetailsUpdateFailure _ ||
          DeviceDetailsRemoveFailure _ ||
          DeviceDetailsDataClearedFailure _ ||
          DeviceDetailsDisconnectFailure _ =>
            DeviceDetailsFormWidget(
              device: device,
              navigation: navigation,
            ),
        };
      },
      listener: (context, state) async {
        if (state is DeviceDetailsUpdateSuccess ||
            state is DeviceDetailsRemoveSucces ||
            state is DeviceDetailsDataClearedSuccess) {
          navigation.pop();
        }
        if (state is DeviceDetailsDisconnectSuccess) {
          await Future.delayed(
            const Duration(
              seconds: 2,
            ),
          );
          navigation.pop();
        }
        if (state is DeviceDetailsUpdateFailure) {
          const SnackBar(
            message: 'Não foi possível atualizar o dispositivo',
            variant: SnackBarVariant.error,
          ).show(context);
        }
        if (state is DeviceDetailsRemoveFailure) {
          const SnackBar(
            message: 'Não foi possível remover o dispositivo',
            variant: SnackBarVariant.error,
          ).show(context);
        }
        if (state is DeviceDetailsDataClearedFailure) {
          const SnackBar(
            message: 'Não foi possível limpar os dados do dispositivo',
            variant: SnackBarVariant.error,
          ).show(context);
        }
        if (state is DeviceDetailsDisconnectFailure) {
          const SnackBar(
            message: 'Não foi possível desconectar o dispositivo',
            variant: SnackBarVariant.error,
          ).show(context);
        }
      },
    );
  }
}
