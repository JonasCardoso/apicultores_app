import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/internet_devices/internet_devices_search_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/local_devices/local_device_section_widget.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:flutter/material.dart';

class DevicesLocalSuccessWidget extends StatelessWidget {
  const DevicesLocalSuccessWidget({
    super.key,
    required this.localDevices,
    required this.navigation,
  });
  final List<LocalBeeDeviceEntity> localDevices;
  final DevicesNavigationDelegate navigation;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        LocalDevicesSectionWidget(
          localDevices: localDevices,
          navigation: navigation,
        ),
        const SliverToBoxAdapter(
          child: InternetDevicesSearchWidget(),
        ),
      ],
    );
  }
}
