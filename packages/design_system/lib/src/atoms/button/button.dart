import 'package:design_system/src/atoms/my_icon/my_icon.dart';
import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/material.dart';

part 'button_variant.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.icon,
    this.fill = false,
  });
  final String label;
  final VoidCallback onPressed;
  final ButtonVariant variant;
  final IconData? icon;
  final bool fill;
  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: Spacing.large,
                vertical: Spacing.medium,
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              Size(fill ? double.infinity : 0, 0),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                MyIcon(
                  icon!,
                ),
                const SizedBox(
                  width: Spacing.small,
                )
              ],
              Text(label, style: MyTypography.h5Regular),
            ],
          ),
        );
      case ButtonVariant.secondary:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: SurfaceColor.primaryPallete.shade800,
              width: 2,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.large,
              vertical: Spacing.medium,
            ),
            minimumSize: Size(fill ? double.infinity : 0, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                MyIcon(
                  icon!,
                ),
                const SizedBox(
                  width: Spacing.small,
                )
              ],
              Text(
                label,
                style: MyTypography.h5Regular
                    .copyWith(color: SurfaceColor.secondary),
              ),
            ],
          ),
        );
    }
  }
}
