import 'package:apicultores_app/features/services/location_picker/business_logic/bloc/location_picker_bloc.dart';
import 'package:apicultores_app/features/services/location_picker/business_logic/use_case/location_picker_use_case.dart';
import 'package:apicultores_app/features/services/location_picker/data/data_sources/geolocator_data_source.dart';
import 'package:apicultores_app/features/services/location_picker/data/repository/location_picker_repository.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPickerBlocProvider extends StatelessWidget {
  const LocationPickerBlocProvider({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationPickerBloc>(
      create: (_) => LocationPickerBloc(
        LocationPickerUseCase(
          LocationPickerRepository(
            geolocatorDataSource: GeolocatorDataSource(),
          ),
        ),
      ),
      child: child,
    );
  }
}
