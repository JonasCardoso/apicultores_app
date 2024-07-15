//Singleton containing all the strings used in the app
class Strings {
  Strings._();
  static const String bottomNavigationItemDevices = "Dispositivos";
  static const String bottomNavigationItemData = "Dados";
  static const String bottomNavigationItemStory = "Histórico";
  static const String bottomNavigationItemDataFirebase = "Dados Firebase";

  static const String errorFeedBackTitle = "Algo deu errado...";
  static const String errorFeedBackDescription =
      "Sentimos muito, mas não foi possível realizar a operação. Tente novamente mais tarde.";
  static const String errorFeedBackButtonLabel = "Tentar novamente";

  static const String devicesScreenTitle = "Dispositivos";
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
  static const String connectDeviceToInternetWiFiAvailablePasswordFieldInvalid =
      "Coloque uma senha válida";

  static const String backToConnectAgain = "Voltar para conectar novamente";

  static const String connectDeviceToInternetFailureTitle = "Algo deu errado";
  static const String connectDeviceToInternetFailureDescription =
      "Não foi possível conectar seu dispositivo à internet. Você pode estar nestes seguintes casos:\n"
      "1. A senha do Wi-Fi pode estar incorreta\n"
      "2. Você pode estar tentando conectar o dispositivo a uma rede 5G. Tente na sua rede normal (2.4G)";
  static const String tryAgain = "Tentar novamente";

  static const connectDeviceToInternetLoadingTitle =
      "Conectando o dispositivo à internet...";

  static const connectDeviceToInternetSuccessTitle =
      "Seu dispositivo está conectado à internet!";

  static const deviceLostConnectionToBluetooth =
      "Seu dispositivo se desconectou do Bluetooth";
  static const deviceLostConnectionToBluetoothDescription =
      "Verifique se o dispositivo está ligado e tente novamente";

  static const saveDeviceFormDeviceNameQuestion =
      "Qual nome deseja por ao seu dispositivo?";
  static const saveDeviceFormDeviceNameDescription =
      "Nome que irá identificar o seu dispositivo da próxima vez que se conectar à internet.";
  static const saveDeviceFormDeviceNameHint = "Ex: Dispositivo Campinas";

  static const saveDeviceFormDeviceLocaleQuestion =
      "Onde se encontra seu dispositivo?";
  static const saveDeviceFormDeviceLocaleDescription =
      "Essa informação é importante para que seja possível trazer dados climáticos da região. ";
  static const saveDeviceFormDeviceLocaleHint = "Buscar localização...";
  static const saveDeviceFormDeviceLocaleCurrent =
      "Localização atual do dispositivo";

  static const saveDeviceFormDeviceLocaleError = "Selecione uma localização";

  static const saveDeviceFormDeviceUpdateTimeQuestion =
      "Com qual frequência deseja salvar os dados de monitoramento?";
  static const saveDeviceFormDeviceUpdateTimeDescription =
      "Por exemplo, se você escolher 1 hora, os dados serão salvos a cada 1 hora.";

  static const saveDeviceFormDeviceUpdateTimeSeconds = "Segundos";
  static const saveDeviceFormDeviceUpdateTimeMinutes = "Minutos";
  static const saveDeviceFormDeviceUpdateTimeHours = "Horas";
  static const saveDeviceFormDeviceUpdateTimeDays = "Dias";

  static const saveDeviceFormButton = "Salvar dispositivo";
  static const saveDeviceFormDeviceNameError = "Coloque um nome válido";
  static const saveDeviceFormDeviceUpdateTimeError = "Coloque um tempo válido";

  static const locationPickerAppBarTitle = "Localização do dispositivo";
  static const locationPickerTitle = "Selecione a sua localização atual";
  static const locationPickerSubtitle =
      "Verifique se você se encontra perto do local em que deseja instalar o seu dispositivo para então clicar no botão abaixo";
  static const locationPickerButtonLabel = "Localização atual";

  static const locationPickerDeniedTitle = "Sua localização está desativada";
  static const locationPickerDeniedSubtitle =
      "Entre nas configurações do aplicativo para poder ligá-las novamente";
  static const locationPickerDeniedButtonLabel = "Abrir configurações";

  static const saveDeviceSuccessTitle = "Tudo pronto!";
  static const saveDeviceSuccessDescription =
      "Agora você pode começar a monitorar seu dispositivo. Clique no botão abaixo para começar";
  static const saveDeviceSuccessButtonLabel = "Começar a monitorar";

  static const devicesSearchingSpinner =
      "Procurando dispositivos conectados à sua internet... Isso pode levar de 1 a 3 minutos";
  static const addNewDeviceButton = "Adicionar novo dispositivo";
  static const devicesSuccessDescription =
      "Estes são os dispositivos conectados a sua rede Wi-fi";
  static const devicesSuccessButton = "Procurar";
  static const devicesLocalCardDisconnectedMessage = "Sem conexão";
  static const devicesLocalCardEmptyMessage =
      "Você ainda não possui dispositivos salvos. Clique no botão abaixo para cadastrar um novo dispositivo via Bluetooth.";
  static const devicesLocalCardEmptyButton = "Cadastrar dispositivo";
  static const savedDevices = "Dispositivos salvos";
  static const foundDevices = "Dispositivos encontrados";

  static const devicesInternetEmptyMessage =
      "Não foi possível encontrar nenhum dispositivo na sua rede.";
  static const devicesInternetEmptyButton = "Procurar novamente";

  static const devicesInternetSearchMessage =
      "Deseja encontrar dispositivos conectados a sua rede?";
  static const devicesInternetSearchButton = "Procurar dispositivos";
}
