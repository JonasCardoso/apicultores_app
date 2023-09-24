import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class SaveDeviceScreen extends StatelessWidget {
  const SaveDeviceScreen({
    super.key,
    required this.deviceEntity,
  });
  final BluetoothDeviceEntity deviceEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBar(
          title: Strings.saveDeviceTitle,
          showBackButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.large,
          ),
          child: FeedBackBanner(
            icon: Icons.send,
            iconColor: SurfaceColor.success,
            title: "Bora ligar o verdinho?",
            description: "Só pra ver se tá funcionando",
            buttonLabel: "Enviar mensagem",
            onButtonClick: () async {
              deviceEntity.write("toggle");
            },
          ),
        ),
      ),
    );
  }
}
