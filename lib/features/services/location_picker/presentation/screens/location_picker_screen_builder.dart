import 'package:apicultores_app/features/services/location_picker/business_logic/bloc/location_picker_bloc.dart';
import 'package:apicultores_app/features/services/location_picker/presentation/navigation/location_picker_navigation.dart';
import 'package:apicultores_app/features/services/location_picker/presentation/widgets/states/location_picker_denied_forever_widget.dart';
import 'package:apicultores_app/features/services/location_picker/presentation/widgets/states/location_picker_initial_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPickerScreenBuilder extends StatelessWidget {
  const LocationPickerScreenBuilder({
    super.key,
    required this.navigationDelegate,
  });
  final LocationPickerNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationPickerBloc, LocationPickerState>(
        listener: (context, state) {
          if (state is LocationPickerCurrentLocationSuccess) {
            navigationDelegate.pop(
              latitude: state.latitude,
              longitude: state.longitude,
            );
          }
        },
        builder: (context, state) => switch (state) {
              LocationPickerInitial _ ||
              LocationPickerCurrentLocationSuccess _ =>
                const LocationPickerInitialWidget(),
              LocationPickerCurrentLocationDeniedForever _ =>
                const LocationPickerDeniedForeverWidget(),
              LocationPickerLoading _ => const Center(
                  child: CircularProgressIndicator(),
                ),
            });
  }
}
