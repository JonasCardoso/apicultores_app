import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_frequency_saving_entity.dart';
import 'package:apicultores_app/features/register_device/save_device/presentation/widgets/save_device_form_widget/frequency_of_data_picker_widget.dart';
import 'package:design_system/design_system.dart';

class DeviceDetailsFrequencyForm extends StatelessWidget {
  const DeviceDetailsFrequencyForm({
    super.key,
    required this.frequencyTime,
  });
  final ValueNotifier<BeeDeviceFrequencySavingEntity> frequencyTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Frequência de coleta',
          style: MyTypography.h5Strong,
        ),
        const SizedBox(
          height: Spacing.medium,
        ),
        FrequencyOfDataPickerWidget(frequencyTime: frequencyTime)
      ],
    );
  }
}
