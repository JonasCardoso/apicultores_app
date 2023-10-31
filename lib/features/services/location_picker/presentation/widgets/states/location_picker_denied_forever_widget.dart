import 'package:apicultores_app/features/services/location_picker/business_logic/bloc/location_picker_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPickerDeniedForeverWidget extends StatelessWidget {
  const LocationPickerDeniedForeverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.location_off_outlined,
      iconColor: SurfaceColor.error,
      title: Strings.locationPickerDeniedTitle,
      description: Strings.locationPickerDeniedSubtitle,
      buttonLabel: Strings.locationPickerDeniedButtonLabel,
      onButtonClick: () {
        context.read<LocationPickerBloc>().add(
              LocationPickerAppSettingsNavigated(),
            );
      },
    );
  }
}
