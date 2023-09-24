//Singleton containing all the strings used in the app
class Strings {
  Strings._();
  static const String bottomNavigationItemDevices = "Dispositivos";
  static const String bottomNavigationItemData = "Dados";
  static const String bottomNavigationItemStory = "Histórico";

  static const String errorFeedBackTitle = "Algo deu errado...";
  static const String errorFeedBackDescription =
      "Sentimos muito, mas não foi possível realizar a operação. Tente novamente mais tarde.";
  static const String errorFeedBackButtonLabel = "Tentar novamente";

  static const String devicesScreenTitle = "Meus dispositivos";
  static const String devicesEmptyScreenTitle =
      "Você ainda não possui nenhum dispositivo cadastrado.";
  static const String devicesEmptyDescription =
      "Clique no botão abaixo para cadastrar um novo dispositivo via Bluetooth.";
  static const String devicesEmptyButton = "Adicionar dispositivo";

  static const String findNewDevicesTitle = "Encontrar novos dispositivos";

  static const String findNewDevicesBluetoothInactiveTitle =
      "Bluetooth desligado";
  static const String findNewDevicesBluetoothInactiveSubtitle =
      'Seu bluetooth está inativo! Clique no botão abaixo para ativar o bluetooth e procurar por dispositivos.';
  static const String findNewDevicesBluetoothInactiveButtonLabel =
      'Ligar bluetooth';
  static const String findNewDevicesListWidgetSearchingLabel =
      'Procurando dispositivos em seu alcance...';
  static const String findNewDevicesListWidgetStopSearchLabel =
      'Lista de dispositivos encontrados';

  static const String findNewDevicesListWidgetStopSearchButtonLabel =
      'Procurar';

  static const String findNewDevicesBluetoothUnavailableTitle =
      "Bluetooth indisponível";
  static const String findNewDevicesBluetoothUnavailableDescription =
      "Seu dispositivo não possui suporte para bluetooth.";
  static const String findNewDevicesBluetoothUnavailableButtonLabel = 'Voltar';

  static const String findNewDevicesEmptyTitle =
      "Nenhum dispositivo encontrado";
  static const String findNewDevicesEmptyDescription =
      "Não foi possível encontrar nenhum dispositivo em seu alcance. Verifique o estado dos aparelhos e tente novamente";
  static const String findNewDevicesEmptyButtonLabel = 'Procurar novamente';

  static const String saveDeviceTitle = "Salvar dispositivo";

  static const String connectDeviceToInternetTitle = "Conectar à internet";
  static const String connectDeviceToInternetFindingWifiTitle =
      "Procurando sua rede Wi-Fi...";
  static const String connectDeviceToInternetLoadingWifiTitle =
      "Carregando dados da sua rede Wi-Fi...";
  static const String connectDeviceToInternetOffTitle = "Sem conexão Wi-Fi";
  static const String connectDeviceToInternetOffSubtitle =
      "Ligue sua internet Wi-Fi para completar a conexão do dispositivo. Após ligar, clique no botão abaixo";
  static const String connectDeviceToInternetOffButtonLabel =
      "Tentar novamente";
  static const String connectDeviceToInternetWiFiFailureTitle =
      "Não foi possível encontrar sua rede Wi-Fi";
  static const String connectDeviceToInternetWiFiFailureSubtitle =
      "Verifique se está conectado em alguma rede Wi-Fi e tente novamente";
  static const String connectDeviceToInternetWiFiFailureButtonLabel =
      "Tentar novamente";
  static String connectDeviceToInternetWiFiAvailableTitle(String wifiName) =>
      "Conecte seu dispositivo à rede $wifiName";
  static const String connectDeviceToInternetWiFiAvailableSubtitle =
      "Para isso, você precisa informar a senha de sua rede para que o dispositivo se conecte à ela.";
  static const String connectDeviceToInternetWiFiAvailablePasswordField =
      "Senha";
}
