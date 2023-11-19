import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/local_bee_device_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/local_devices/local_device_small_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_system/design_system.dart';

class GraphsDevicesCarousel extends StatelessWidget {
  const GraphsDevicesCarousel({
    super.key,
    required this.localDevices,
    required this.onDeviceSelected,
    this.selectedDevice,
  });
  final List<LocalBeeDeviceEntity> localDevices;
  final void Function(LocalBeeDeviceEntity) onDeviceSelected;
  final LocalBeeDeviceEntity? selectedDevice;
  @override
  Widget build(BuildContext context) {
    final connectedDevices = localDevices
        .where((device) => device.status == LocalBeeDeviceStatus.connected)
        .toList();

    if (connectedDevices.isNotEmpty) {
      final selectedDevice = this.selectedDevice ?? connectedDevices.first;
      final indexOfSelectedDevice = connectedDevices.indexOf(selectedDevice);
      final initialPage =
          indexOfSelectedDevice != -1 ? indexOfSelectedDevice : 0;
      return CarouselSlider.builder(
        itemCount: connectedDevices.length,
        itemBuilder: (context, index, _) {
          return LocalDeviceSmallCard(
            localDevice: connectedDevices[index],
            isSelected: connectedDevices[index] == selectedDevice,
          );
        },
        options: CarouselOptions(
          initialPage: initialPage,
          viewportFraction: 0.6,
          enableInfiniteScroll: false,
          aspectRatio: 4.6,
          enlargeCenterPage: true,
          onPageChanged: (index, _) {
            onDeviceSelected(connectedDevices[index]);
          },
        ),
      );
    } else {
      return const Padding(
        padding: EdgeInsets.symmetric(
          vertical: Spacing.large,
        ),
        child: Center(
          child: Text(
            "Não há dispositivos conectados",
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }
}
