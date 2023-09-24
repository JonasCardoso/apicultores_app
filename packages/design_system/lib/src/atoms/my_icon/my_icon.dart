import 'package:design_system/src/theme/color.dart';
import 'package:flutter/material.dart';
part 'icon_variants.dart';

class MyIcon extends StatelessWidget {
  const MyIcon(
    this.icon, {
    super.key,
    this.color = TextColor.primary,
    this.iconSize = IconSize.small,
  });
  final IconData icon;
  final Color color;
  final IconSize iconSize;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: iconSize.size,
    );
  }
}
