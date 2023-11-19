part of 'save_device_form_widget.dart';

class _QuestionWidget extends StatelessWidget {
  const _QuestionWidget({
    required this.question,
    required this.icon,
  });
  final String question;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyIcon(
          icon,
          iconSize: IconSize.medium,
          color: SurfaceColor.primaryPallete.shade800,
        ),
        const SizedBox(
          width: Spacing.small,
        ),
        Expanded(
          child: Text(
            question,
            style: MyTypography.h3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: MyTypography.captionRegular.copyWith(
        color: TextColor.unspecial,
      ),
    );
  }
}
