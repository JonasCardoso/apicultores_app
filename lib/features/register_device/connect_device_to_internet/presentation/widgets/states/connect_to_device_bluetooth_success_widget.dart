import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class ConnectToDeviceBluetoothSuccessWidget extends StatelessWidget {
  const ConnectToDeviceBluetoothSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyIcon(
            Icons.wifi,
            color: SurfaceColor.success,
            iconSize: IconSize.huge,
          ),
          const SizedBox(
            height: Spacing.large,
          ),
          Text(
            Strings.connectDeviceToInternetSuccessTitle,
            style: MyTypography.h3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
