import 'package:design_system/design_system.dart';
import 'package:design_system/src/atoms/button/button.dart';
import 'package:design_system/src/theme/theme.dart';
import 'package:flutter/material.dart';

class FeedBackBanner extends StatelessWidget {
  const FeedBackBanner({
    super.key,
    required this.icon,
    this.iconColor = SurfaceColor.primary,
    required this.title,
    required this.description,
    required this.buttonLabel,
    required this.onButtonClick,
  });
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String buttonLabel;
  final VoidCallback onButtonClick;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyIcon(
            icon,
            iconSize: IconSize.xxlarge,
            color: iconColor,
          ),
          const SizedBox(
            height: Spacing.large,
          ),
          Text(
            title,
            style: MyTypography.h4Strong,
          ),
          const SizedBox(
            height: Spacing.medium,
          ),
          Text(
            description,
            style: MyTypography.bodyRegular,
          ),
          const SizedBox(
            height: Spacing.medium,
          ),
          Button(
            label: buttonLabel,
            fill: true,
            onPressed: onButtonClick,
          ),
        ],
      ),
    );
  }
}
