import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_list_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_searching/devices_searching_spinner.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/internet_devices/devices_success_search_again.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/internet_devices/internet_devices_empty_widget.dart';
import 'package:design_system/design_system.dart';

class InternetDevicesSectionWidget extends StatelessWidget {
  const InternetDevicesSectionWidget({
    super.key,
    required this.internetDevices,
    required this.isLoading,
  });

  final List<BeeDeviceEntity> internetDevices;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(
        child: Column(
          children: [
            if (isLoading)
              const DevicesSearchingSpinner()
            else if (!isLoading && internetDevices.isNotEmpty)
              const DevicesSuccessSearchAgain(),
            const SizedBox(
              height: Spacing.medium,
            ),
          ],
        ),
      ),
      if (internetDevices.isNotEmpty)
        DevicesListWidget(
          devices: internetDevices,
        )
      else if (!isLoading && internetDevices.isEmpty)
        const SliverToBoxAdapter(
          child: InternetDevicesEmptyWidget(),
        )
    ]);
  }
}
