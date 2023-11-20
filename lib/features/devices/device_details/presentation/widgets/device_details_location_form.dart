import 'package:apicultores_app/features/devices/device_details/presentation/device_details_navigation.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_location_entity.dart';
import 'package:design_system/design_system.dart';

class DeviceDetailsLocationForm extends StatefulWidget {
  const DeviceDetailsLocationForm({
    super.key,
    required this.location,
    required this.navigation,
  });

  final ValueNotifier<BeeDeviceLocationEntity> location;
  final DeviceDetailsNavigation navigation;

  @override
  State<DeviceDetailsLocationForm> createState() =>
      _DeviceDetailsLocationFormState();
}

class _DeviceDetailsLocationFormState extends State<DeviceDetailsLocationForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Localização do seu dispositivo',
          style: MyTypography.h5Strong,
        ),
        const SizedBox(
          height: Spacing.small,
        ),
        Row(
          children: [
            _InformationWidget(
              sub: 'Lat:',
              main: widget.location.value.latitude.toString(),
            ),
            const SizedBox(
              width: Spacing.large,
            ),
            _InformationWidget(
              sub: 'Lon:',
              main: widget.location.value.longitude.toString(),
            ),
          ],
        ),
        const SizedBox(
          height: Spacing.medium,
        ),
        Button(
          label: 'Mudar localização',
          fill: true,
          icon: Icons.location_pin,
          onPressed: () async {
            final locationResult =
                await widget.navigation.navigateToPickLocation();
            if (locationResult != null) {
              setState(() {
                final latitude = locationResult['latitude'];
                final longitude = locationResult['longitude'];
                final newLocation = BeeDeviceLocationEntity(
                  latitude: latitude,
                  longitude: longitude,
                );
                widget.location.value = newLocation;
              });
            }
          },
          variant: ButtonVariant.outlined,
        )
      ],
    );
  }
}

class _InformationWidget extends StatelessWidget {
  const _InformationWidget({
    required this.sub,
    required this.main,
  });
  final String sub;
  final String main;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          sub,
          style: MyTypography.captionStrong.copyWith(
            color: TextColor.unspecial,
          ),
        ),
        const SizedBox(
          width: Spacing.small,
        ),
        Text(
          main,
          style: MyTypography.bodyRegular,
        ),
      ],
    );
  }
}
