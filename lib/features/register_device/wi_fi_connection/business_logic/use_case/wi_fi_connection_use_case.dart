import 'package:apicultores_app/features/register_device/wi_fi_connection/data/repositories/available_wi_fi_repository.dart';
import 'package:apicultores_app/features/services/location_picker/data/repository/location_picker_repository.dart';

class WiFiConnectionUseCase {
  final AvailableWiFiRepository _availableWiFiRepository;
  final LocationPickerRepository _locationPickerRepository;
  WiFiConnectionUseCase({
    required AvailableWiFiRepository availableWiFiRepository,
    required LocationPickerRepository locationPickerRepository,
  })  : _availableWiFiRepository = availableWiFiRepository,
        _locationPickerRepository = locationPickerRepository;

  Stream<bool> get isConnectedToWifiStream =>
      _availableWiFiRepository.isConnectedToWiFiStream;

  Future<bool> isConnectedToWifi() =>
      _availableWiFiRepository.isConnectedToWifi();

  Future<bool> isLocationPermitted() =>
      _locationPickerRepository.isLocationPermitted();

  Future<bool> requestLocationPermission() =>
      _locationPickerRepository.requestPermission();

  Future<void> openLocationSettings() =>
      _locationPickerRepository.openAppSettings();

  Future<String> getWiFiName() => _availableWiFiRepository.getWiFiName();
}
