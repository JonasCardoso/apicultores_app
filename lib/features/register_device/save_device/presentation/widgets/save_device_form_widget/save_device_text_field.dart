part of 'save_device_form_widget.dart';

class _SaveDeviceNameForm extends StatelessWidget {
  const _SaveDeviceNameForm({
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _QuestionWidget(
          question: Strings.saveDeviceFormDeviceNameQuestion,
          icon: Icons.account_circle,
        ),
        const SizedBox(
          height: Spacing.small,
        ),
        const _DescriptionWidget(
          description: Strings.saveDeviceFormDeviceNameDescription,
        ),
        const SizedBox(
          height: Spacing.medium,
        ),
        TextField(
          controller: controller,
          icon: Icons.edit,
          hint: Strings.saveDeviceFormDeviceNameHint,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return Strings.saveDeviceFormDeviceNameError;
            }
            return null;
          },
        ),
      ],
    );
  }
}
