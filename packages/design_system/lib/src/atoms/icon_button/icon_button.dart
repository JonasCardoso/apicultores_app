import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart' as material;

part 'icon_button_variant.dart';
part 'icon_button_size.dart';

class IconButton extends StatelessWidget {
  const IconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.variant = IconButtonVariant.primary,
    this.size = IconButtonSize.medium,
  });
  final IconData icon;
  final VoidCallback? onPressed;
  final IconButtonVariant variant;
  final IconButtonSize size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: onPressed == null
            ? SurfaceColor.deactivated
            : switch (variant) {
                IconButtonVariant.primary => SurfaceColor.primary,
                IconButtonVariant.secondary =>
                  SurfaceColor.primaryPallete.shade200,
                IconButtonVariant.outlined => Colors.transparent,
              },
        borderRadius: BorderRadius.circular(48),
        border: Border.all(
          color: variant == IconButtonVariant.outlined
              ? SurfaceColor.primary
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: material.IconButton(
        padding: size == IconButtonSize.small
            ? const EdgeInsets.all(Spacing.xtiny)
            : null,
        constraints:
            size == IconButtonSize.small ? const BoxConstraints() : null,
        icon: MyIcon(
          icon,
          iconSize:
              size == IconButtonSize.small ? IconSize.small : IconSize.medium,
          color: onPressed == null
              ? TextColor.deactivated
              : variant == IconButtonVariant.outlined
                  ? TextColor.special
                  : TextColor.primary,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
