import 'package:design_system/src/atoms/atoms.dart';
import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    this.onTap,
    required this.icon,
    this.iconColor,
    required this.title,
    this.subtitle,
    this.leading,
    this.backgroundColor,
  });
  final VoidCallback? onTap;
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ??
              (onTap != null
                  ? SurfaceColor.foregroundColor
                  : SurfaceColor.disabled),
          borderRadius: BorderRadius.circular(Spacing.small),
          boxShadow: onTap != null
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
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
                  MyIcon(
                    icon,
                    color: iconColor ?? SurfaceColor.primary,
                    iconSize: IconSize.large,
                  ),
                  const SizedBox(
                    width: Spacing.medium,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: MyTypography.captionRegular.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(
                          height: Spacing.small,
                        ),
                        Text(
                          subtitle!,
                          style: MyTypography.small,
                        ),
                      ],
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
