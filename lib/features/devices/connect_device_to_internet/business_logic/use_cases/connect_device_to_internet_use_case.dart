import 'package:apicultores_app/features/devices/connect_device_to_internet/data/repositories/available_wi_fi_repository.dart';

class ConnectDeviceToInternetUseCase {
  final AvailableWiFiRepository _availableWiFiRepository;

  ConnectDeviceToInternetUseCase(this._availableWiFiRepository);

  Stream<bool> get isConnectedToWifi =>
      _availableWiFiRepository.isConnectedToWiFi;

  Future<String> getWiFiName() => _availableWiFiRepository.getWiFiName();
}
