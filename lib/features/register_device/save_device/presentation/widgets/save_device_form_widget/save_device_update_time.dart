part of 'save_device_form_widget.dart';

class _SaveDeviceUpdateTime extends StatelessWidget {
  const _SaveDeviceUpdateTime({
    required this.frequencyTime,
  });
  final ValueNotifier<BeeDeviceFrequencySavingEntity> frequencyTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _QuestionWidget(
          question: Strings.saveDeviceFormDeviceUpdateTimeQuestion,
          icon: Icons.timer,
        ),
        const SizedBox(
          height: Spacing.small,
        ),
        const _DescriptionWidget(
          description: Strings.saveDeviceFormDeviceUpdateTimeDescription,
        ),
        const SizedBox(
          height: Spacing.medium,
        ),
        FrequencyOfDataPickerWidget(frequencyTime: frequencyTime),
      ],
    );
  }
}
