import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:collection/collection.dart';

class InternetDeviceItemCard extends StatelessWidget {
  const InternetDeviceItemCard({
    super.key,
    required this.device,
  });
  final BeeDeviceEntity device;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDevicesBloc, MyDevicesState>(
      builder: (context, state) {
        final myDevicesBloc = BlocProvider.of<MyDevicesBloc>(context);
        final LocalBeeDeviceEntity? registeredDevice = state is MyDevicesSuccess
            ? state.devices.firstWhereOrNull(
                (localDevice) => localDevice.device.id == device.id)
            : null;
        final isDeviceAlreadySaved =
            registeredDevice != null && registeredDevice.device == device;
        final isDeviceSavedButChanged =
            registeredDevice != null && registeredDevice.device != device;

        return ItemCard(
          icon: Icons.devices,
          title: device.name,
          leading: isDeviceAlreadySaved
              ? Row(
                  children: [
                    const MyIcon(
                      Icons.check,
                      color: SurfaceColor.success,
                      iconSize: IconSize.small,
                    ),
                    const SizedBox(
                      width: Spacing.small,
                    ),
                    Text(
                      "Cadastrado",
                      style: MyTypography.small,
                    ),
                  ],
                )
              : isDeviceSavedButChanged
                  ? Row(
                      children: [
                        const MyIcon(
                          Icons.update,
                          color: SurfaceColor.success,
                          iconSize: IconSize.small,
                        ),
                        const SizedBox(
                          width: Spacing.small,
                        ),
                        Text(
                          "Atualizar",
                          style: MyTypography.small,
                        ),
                      ],
                    )
                  : null,
          onTap: isDeviceAlreadySaved
              ? null
              : () async {
                  final shouldSaveLocally = await showDialog<bool>(
                          context: context, builder: confirmationBuilder) ??
                      false;
                  if (shouldSaveLocally) {
                    myDevicesBloc.add(
                      MyDevicesNewAdded(device: device),
                    );
                  }
                },
        );
      },
    );
  }

  Widget confirmationBuilder(BuildContext context) => AlertDialog(
        title: const Text("Salvar dispositivo?"),
        content: Text(
            "Você deseja salvar o dispositivo ${device.name} no seu aparelho?"),
        actions: [
          Button(
              label: 'Cancelar',
              variant: ButtonVariant.secondary,
              onPressed: () {
                Modular.to.pop(false);
              }),
          Button(
              label: 'Salvar',
              variant: ButtonVariant.primary,
              onPressed: () {
                Modular.to.pop(true);
              })
        ],
      );
}
