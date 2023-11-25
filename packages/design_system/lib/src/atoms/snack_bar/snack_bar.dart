import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart' as material;

class SnackBar extends StatelessWidget {
  final String message;
  final SnackBarVariant variant;
  final IconData? icon;

  const SnackBar({
    super.key,
    required this.message,
    required this.variant,
    this.icon,
  }) : assert(
          icon == null || variant == SnackBarVariant.none,
          'Icon must be provided when variant is none',
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.medium,
        vertical: Spacing.medium,
      ),
      decoration: BoxDecoration(
        color: TextColor.primary,
        borderRadius: BorderRadius.circular(
          Spacing.huge,
        ),
      ),
      child: Row(
        children: [
          switch (variant) {
            SnackBarVariant.success => const MyIcon(
                Icons.check_circle,
                color: SurfaceColor.success,
              ),
            SnackBarVariant.warning => const MyIcon(
                Icons.warning,
                color: SurfaceColor.primary,
              ),
            SnackBarVariant.error => const MyIcon(
                Icons.error,
                color: SurfaceColor.error,
              ),
            SnackBarVariant.none => MyIcon(
                icon!,
                color: SurfaceColor.foregroundColor,
              ),
          },
          Expanded(
            child: Text(
              message,
              style: MyTypography.captionStrong.copyWith(
                color: SurfaceColor.foregroundColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      material.SnackBar(
        content: this,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}

enum SnackBarVariant {
  success,
  warning,
  error,
  none,
}
