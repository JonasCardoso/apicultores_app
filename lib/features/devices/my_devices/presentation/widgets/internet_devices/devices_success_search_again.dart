import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/internet_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesSuccessSearchAgain extends StatelessWidget {
  const DevicesSuccessSearchAgain({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            Strings.devicesSuccessDescription,
            style: MyTypography.h5Regular,
          ),
        ),
        const SizedBox(
          width: Spacing.small,
        ),
        Button(
            label: Strings.devicesSuccessButton,
            variant: ButtonVariant.secondary,
            onPressed: () {
              context
                  .read<InternetDevicesBloc>()
                  .add(const InternetDevicesFetched());
            }),
      ],
    );
  }
}
