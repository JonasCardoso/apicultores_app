import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class DevicesSearchingSpinner extends StatelessWidget {
  const DevicesSearchingSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: Spacing.large,
          height: Spacing.large,
          child: CircularProgressIndicator(),
        ),
        const SizedBox(
          width: Spacing.medium,
        ),
        Expanded(
          child: Text(
            Strings.devicesSearchingSpinner,
            style: MyTypography.h5Regular,
          ),
        ),
      ],
    );
  }
}
