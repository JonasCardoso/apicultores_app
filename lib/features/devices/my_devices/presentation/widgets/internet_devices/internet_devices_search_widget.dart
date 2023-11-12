import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/internet_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetDevicesSearchWidget extends StatelessWidget {
  const InternetDevicesSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const MyIcon(
                Icons.wifi,
                color: SurfaceColor.primary,
                iconSize: IconSize.xlarge,
              ),
              const SizedBox(
                width: Spacing.small,
              ),
              Expanded(
                child: Text(
                  Strings.devicesInternetSearchMessage,
                  style: MyTypography.captionRegular,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Spacing.large,
          ),
          Button(
            label: Strings.devicesInternetSearchButton,
            fill: true,
            variant: ButtonVariant.secondary,
            onPressed: () {
              BlocProvider.of<InternetDevicesBloc>(context)
                  .add(const InternetDevicesFetched());
            },
          ),
        ],
      ),
    );
  }
}
