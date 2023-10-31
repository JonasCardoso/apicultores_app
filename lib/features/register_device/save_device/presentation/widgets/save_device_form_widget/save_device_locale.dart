part of 'save_device_form_widget.dart';

class _SaveDeviceLocale extends StatefulWidget {
  const _SaveDeviceLocale({
    required this.locationInformation,
  });
  final _LocationInformation locationInformation;
  @override
  State<_SaveDeviceLocale> createState() => _SaveDeviceLocaleState();
}

class _SaveDeviceLocaleState extends State<_SaveDeviceLocale> {
  @override
  Widget build(BuildContext context) {
    final locationIsSelected = widget.locationInformation.latitude != null &&
        widget.locationInformation.longitude != null;
    return FormField(
      validator: (value) {
        if (!locationIsSelected) {
          return Strings.saveDeviceFormDeviceLocaleError;
        }
        return null;
      },
      builder: (formFieldState) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _QuestionWidget(
            question: Strings.saveDeviceFormDeviceLocaleQuestion,
            icon: Icons.location_on,
          ),
          const SizedBox(
            height: Spacing.small,
          ),
          const _DescriptionWidget(
            description: Strings.saveDeviceFormDeviceLocaleDescription,
          ),
          const SizedBox(
            height: Spacing.medium,
          ),
          Button(
            fill: true,
            variant: ButtonVariant.secondary,
            icon: locationIsSelected ? Icons.check : Icons.search,
            label: locationIsSelected
                ? Strings.saveDeviceFormDeviceLocaleCurrent
                : Strings.saveDeviceFormDeviceLocaleHint,
            onPressed: () async {
              final locationResult = await const SaveDeviceNavigationDelegate()
                  .navigateToPickLocation();
              if (locationResult != null) {
                setState(() {
                  widget.locationInformation.latitude =
                      locationResult['latitude'];
                  widget.locationInformation.longitude =
                      locationResult['longitude'];
                });
              }
            },
          ),
          if (formFieldState.hasError) ...[
            const SizedBox(
              height: Spacing.small,
            ),
            Text(
              formFieldState.errorText!,
              style: MyTypography.small.copyWith(
                color: SurfaceColor.error,
              ),
            )
          ]
        ],
      ),
    );
  }
}

class _LocationInformation {
  double? latitude;
  double? longitude;

  BeeDeviceLocationEntity toEntity() {
    return BeeDeviceLocationEntity(
      latitude: latitude ?? 0,
      longitude: longitude ?? 0,
    );
  }
}
