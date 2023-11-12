import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/internet_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetDevicesEmptyWidget extends StatelessWidget {
  const InternetDevicesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          Strings.devicesInternetEmptyMessage,
          style: MyTypography.captionRegular,
        ),
        const SizedBox(
          height: Spacing.medium,
        ),
        Button(
          label: Strings.devicesInternetEmptyButton,
          variant: ButtonVariant.secondary,
          fill: true,
          onPressed: () {
            BlocProvider.of<InternetDevicesBloc>(context)
                .add(const InternetDevicesFetched());
          },
        ),
      ],
    );
  }
}
