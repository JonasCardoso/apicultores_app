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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: SurfaceColor.foregroundColor,
          borderRadius: BorderRadius.circular(Spacing.small),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.medium,
            vertical: Spacing.medium,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const MyIcon(
                    Icons.bluetooth,
                    color: Colors.blue,
                    iconSize: IconSize.large,
                  ),
                  const SizedBox(
                    width: Spacing.medium,
                  ),
                  Column(
                    children: [
                      Text(
                        '$name ($type)',
                        style: MyTypography.p.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: Spacing.small,
                      ),
                      Text(
                        remoteId,
                        style: MyTypography.small,
                      ),
                    ],
                  )
                ],
              ),
              if (leading != null) leading!
            ],
          ),
        ),
      ),
    );
  }
}
