import 'package:apicultores_app/features/register_device/wi_fi_connection/data/repositories/available_wi_fi_repository.dart';

class WiFiConnectionUseCase {
  final AvailableWiFiRepository _availableWiFiRepository;

  WiFiConnectionUseCase({
    required AvailableWiFiRepository availableWiFiRepository,
  }) : _availableWiFiRepository = availableWiFiRepository;

  Stream<bool> get isConnectedToWifiStream =>
      _availableWiFiRepository.isConnectedToWiFiStream;

  Future<bool> isConnectedToWifi() =>
      _availableWiFiRepository.isConnectedToWifi();

  Future<String> getWiFiName() => _availableWiFiRepository.getWiFiName();
}
