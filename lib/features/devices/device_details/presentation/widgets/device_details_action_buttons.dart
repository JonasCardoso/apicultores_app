import 'package:apicultores_app/features/devices/device_details/business_logic/bloc/device_details_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceDetailsActionButtons extends StatelessWidget {
  const DeviceDetailsActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button(
          label: 'Remover dispositivo',
          icon: Icons.delete,
          fill: true,
          variant: ButtonVariant.destructive,
          onPressed: () {
            context.read<DeviceDetailsBloc>().add(
                  const DeviceDetailsRemoved(),
                );
          },
        ),
        const SizedBox(
          height: Spacing.medium,
        ),
      ],
    );
  }
}
