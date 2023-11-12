import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/local_devices/local_device_card.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/local_devices/local_devices_empty.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalDevicesSectionWidget extends StatelessWidget {
  const LocalDevicesSectionWidget({
    super.key,
    required this.localDevices,
    required this.navigation,
  });
  final List<LocalBeeDeviceEntity> localDevices;
  final DevicesNavigationDelegate navigation;
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      if (localDevices.isNotEmpty)
        SliverToBoxAdapter(
          child: Column(
            children: [
              Button(
                  label: "Novo dispositivo",
                  fill: true,
                  icon: Icons.add,
                  onPressed: () {
                    navigation.navigateToFindDevices();
                  }),
              const SizedBox(
                height: Spacing.small,
              ),
              const SizedBox(
                height: Spacing.large,
              ),
            ],
          ),
        ),
      localDevices.isNotEmpty
          ? SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: Spacing.small,
                crossAxisSpacing: Spacing.small,
                childAspectRatio: 1.5,
              ),
              itemCount: localDevices.length,
              itemBuilder: (context, index) {
                final localDevice = localDevices[index];
                return LocalDeviceCard(
                  localDevice: localDevice,
                );
              },
            )
          : SliverToBoxAdapter(
              child: LocalDevicesEmptyWidget(
                navigation: navigation,
              ),
            ),
    ]);
  }
}
