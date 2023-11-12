import 'package:apicultores_app/features/register_device/wi_fi_connection/business_logic/bloc/wi_fi_connection_bloc.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/business_logic/use_case/wi_fi_connection_use_case.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/data/data_sources/connectivity_data_source.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/data/data_sources/network_info_data_source.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/data/repositories/available_wi_fi_repository.dart';
import 'package:apicultores_app/features/services/location_picker/data/data_sources/geolocator_data_source.dart';
import 'package:apicultores_app/features/services/location_picker/data/repository/location_picker_repository.dart';

class WiFiConnectionBlocRepository {
  static final WiFiConnectionBlocRepository instance =
      WiFiConnectionBlocRepository._(
    WiFiConnectionBloc(
      WiFiConnectionUseCase(
        locationPickerRepository: LocationPickerRepository(
          geolocatorDataSource: GeolocatorDataSource(),
        ),
        availableWiFiRepository: AvailableWiFiRepository(
          connectivityDataSource: ConnectivityDataSource(),
          networkPlusDataSource: NetworkInfoDataSource(),
        ),
      ),
    )..add(WiFiConnectionFetched()),
  );
  const WiFiConnectionBlocRepository._(this.wiFiConnectionBloc);

  factory WiFiConnectionBlocRepository() => instance;
  final WiFiConnectionBloc wiFiConnectionBloc;
}
