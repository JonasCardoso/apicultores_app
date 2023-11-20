import 'package:design_system/design_system.dart';

class DeviceDetailsNameForm extends StatelessWidget {
  const DeviceDetailsNameForm({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      variant: TextFieldVariant.line,
      icon: Icons.edit,
      style: MyTypography.h3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'O nome não pode ser vazio';
        }
        return null;
      },
    );
  }
}
