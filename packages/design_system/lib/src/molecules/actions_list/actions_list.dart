import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class ActionsList extends StatelessWidget {
  const ActionsList({
    super.key,
    required this.items,
  });
  final List<ActionsListItem> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.mapIndexed((index, item) {
        final leftIcon = item.leftIcon;
        final rightIcon = item.rightIcon;
        return GestureDetector(
          onTap: item.onPressed,
          child: Column(
            children: [
              if (index != 0)
                const SizedBox(
                  height: Spacing.large,
                ),
              Row(
                children: [
                  if (leftIcon != null) ...[
                    MyIcon(leftIcon,
                        iconSize: IconSize.small,
                        color: switch (item.variant) {
                          ActionsListItemVariant.primary => TextColor.special,
                          ActionsListItemVariant.secondary => TextColor.primary,
                          ActionsListItemVariant.destructive =>
                            SurfaceColor.error,
                        }),
                    const SizedBox(
                      width: Spacing.large,
                    )
                  ],
                  Text(
                    item.label,
                    style: MyTypography.bodyStrong.copyWith(
                      color: item.variant == ActionsListItemVariant.destructive
                          ? SurfaceColor.error
                          : TextColor.primary,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  if (rightIcon != null)
                    MyIcon(rightIcon,
                        iconSize: IconSize.medium,
                        color: switch (item.variant) {
                          ActionsListItemVariant.primary => TextColor.special,
                          ActionsListItemVariant.secondary => TextColor.primary,
                          ActionsListItemVariant.destructive =>
                            SurfaceColor.error,
                        }),
                ],
              ),
              const SizedBox(
                height: Spacing.large,
              ),
              if (index != items.length - 1)
                const Divider(
                  height: 1,
                  thickness: 1,
                ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class ActionsListItem {
  final String label;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback onPressed;
  final ActionsListItemVariant variant;

  const ActionsListItem({
    required this.label,
    this.leftIcon,
    this.rightIcon,
    required this.onPressed,
    this.variant = ActionsListItemVariant.primary,
  });
}

enum ActionsListItemVariant {
  primary,
  secondary,
  destructive,
}
