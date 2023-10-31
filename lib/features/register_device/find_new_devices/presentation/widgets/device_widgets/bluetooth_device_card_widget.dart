import 'package:design_system/design_system.dart';

class BluetoothDeviceCardWidget extends StatelessWidget {
  const BluetoothDeviceCardWidget({
    super.key,
    required this.name,
    required this.remoteId,
    required this.type,
    this.leading,
    this.onTap,
  });
  final String name;
  final String remoteId;
  final String type;
  final Widget? leading;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ItemCard(
      icon: Icons.bluetooth,
      iconColor: Colors.blue,
      title: '$name ($type)',
      subtitle: remoteId,
      leading: leading,
      onTap: onTap,
    );
  }
}
