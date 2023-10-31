import 'package:apicultores_app/features/services/location_picker/presentation/navigation/location_picker_navigation.dart';
import 'package:apicultores_app/features/services/location_picker/presentation/screens/location_picker_screen_builder.dart';
import 'package:apicultores_app/features/services/location_picker/presentation/widgets/location_picker_bloc_provider.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class LocationPickerScreen extends StatelessWidget {
  const LocationPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Strings.locationPickerAppBarTitle,
          showBackButton: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.large,
          ),
          child: LocationPickerBlocProvider(
            child: LocationPickerScreenBuilder(
              navigationDelegate: LocationPickerNavigationDelegate(),
            ),
          ),
        ),
      ),
    );
  }
}
