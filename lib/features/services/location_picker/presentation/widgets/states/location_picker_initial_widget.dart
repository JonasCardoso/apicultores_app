import 'package:apicultores_app/features/services/location_picker/business_logic/bloc/location_picker_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPickerInitialWidget extends StatelessWidget {
  const LocationPickerInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.location_on_outlined,
      title: Strings.locationPickerTitle,
      description: Strings.locationPickerSubtitle,
      buttonLabel: Strings.locationPickerButtonLabel,
      onButtonClick: () {
        context.read<LocationPickerBloc>().add(
              LocationPickerCurrentLocationAsked(),
            );
      },
    );
  }
}
