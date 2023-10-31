import 'package:design_system/src/atoms/my_icon/my_icon.dart';
import 'package:design_system/src/theme/color.dart';
import 'package:design_system/src/theme/my_typography.dart';
import 'package:design_system/src/theme/spacing.dart';
import 'package:flutter/material.dart';
part 'constants.dart';

class AppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
  });
  final String title;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _appBarHeight,
      color: SurfaceColor.foregroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.large,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showBackButton)
              Column(
                children: [
                  const SizedBox(
                    height: Spacing.medium,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).maybePop();
                    },
                    child: Container(
                      height: Spacing.xxxlarge,
                      width: Spacing.xxxlarge,
                      decoration: const BoxDecoration(
                        color: SurfaceColor.backgroundColor,
                        shape: BoxShape.circle,
                      ),
                      child: const MyIcon(
                        Icons.chevron_left,
                        iconSize: IconSize.large,
                        color: TextColor.special,
                      ),
                    ),
                  ),
                ],
              )
            else
              const SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: MyTypography.h2.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_appBarHeight);
}
