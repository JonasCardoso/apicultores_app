import 'package:apicultores_app/di/app_composition_root.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_entity.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/states/connect_to_device_bluetooth_success_widget.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class ConnectDeviceToInternetSuccessWidget extends StatelessWidget {
  const ConnectDeviceToInternetSuccessWidget({
    super.key,
    required this.deviceIp,
    required this.possibleRegisteredDevice,
    required this.navigationDelegate,
  });

  final String deviceIp;
  final BeeDeviceEntity? possibleRegisteredDevice;
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    final possibleRegisteredDevice = this.possibleRegisteredDevice;
    if (possibleRegisteredDevice != null) {
      return FeedBackBanner(
        icon: Icons.devices,
        iconColor: SurfaceColor.success,
        title: "Dispositivo ${possibleRegisteredDevice.name} encontrado",
        description:
            "Encontramos um dispositivo já cadastrado e com dados disponíveis.",
        buttonLabel: "Ir para dispositivos",
        onButtonClick: () {
          AppCompositionRoot()
              .makeMyDevicesBloc()
              .add(const MyDevicesLocalFetched());
          navigationDelegate.navigateToDevices();
        },
      );
    }
    return const ConnectToDeviceBluetoothSuccessWidget();
  }
}
