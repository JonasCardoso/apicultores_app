import 'package:apicultores_app/features/devices/device_details/business_logic/bloc/device_details_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceDetailsActionButtons extends StatelessWidget {
  const DeviceDetailsActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionsList(items: [
      ActionsListItem(
        label: 'Limpar dados coletados',
        leftIcon: Icons.data_usage,
        onPressed: () {
          context.read<DeviceDetailsBloc>().add(
                const DeviceDetailsDataCleared(),
              );
        },
      ),
      ActionsListItem(
        label: 'Desconectar dispositivo',
        leftIcon: Icons.wifi_off,
        onPressed: () {
          context.read<DeviceDetailsBloc>().add(
                const DeviceDetailsDisconnected(),
              );
        },
      ),
      ActionsListItem(
        label: 'Remover dispositivo',
        leftIcon: Icons.delete,
        variant: ActionsListItemVariant.destructive,
        onPressed: () {
          context.read<DeviceDetailsBloc>().add(
                const DeviceDetailsRemoved(),
              );
        },
      ),
    ]);
  }
}
