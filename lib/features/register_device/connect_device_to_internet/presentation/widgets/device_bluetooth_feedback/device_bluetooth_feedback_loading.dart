import 'package:design_system/design_system.dart';

class DeviceBluetoothFeedBackLoading extends StatelessWidget {
  const DeviceBluetoothFeedBackLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(
            height: Spacing.large,
          ),
          Text(
            "Conectando com o dispositivo...",
            style: MyTypography.h5Regular,
          ),
        ],
      ),
    );
  }
}
