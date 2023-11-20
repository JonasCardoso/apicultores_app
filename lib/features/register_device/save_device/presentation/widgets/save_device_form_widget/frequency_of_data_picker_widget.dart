import 'package:apicultores_app/features/devices/my_devices/business_logic/entities/bee_device_frequency_saving_entity.dart';
import 'package:apicultores_app/features/devices/my_devices/data/dtos/enums/bee_frequency_time_unit.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class FrequencyOfDataPickerWidget extends StatelessWidget {
  const FrequencyOfDataPickerWidget({
    super.key,
    required this.frequencyTime,
  });
  final ValueNotifier<BeeDeviceFrequencySavingEntity> frequencyTime;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _NumberTextField(
          frequencyTime: frequencyTime,
        ),
        const SizedBox(
          width: Spacing.medium,
        ),
        _TimeUnitDropDown(
          frequencyTime: frequencyTime,
        ),
      ],
    );
  }
}

class _NumberTextField extends StatelessWidget {
  _NumberTextField({
    required this.frequencyTime,
  }) : controller = TextEditingController(
          text: frequencyTime.value.timeValue.toString(),
        );
  final ValueNotifier<BeeDeviceFrequencySavingEntity> frequencyTime;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Spacing.xhuge,
      child: TextField(
        controller: controller,
        style: MyTypography.h3.copyWith(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.isNotEmpty) {
            frequencyTime.value = frequencyTime.value.copyWith(
              timeValue: int.parse(value),
            );
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return Strings.saveDeviceFormDeviceUpdateTimeError;
          }
          return null;
        },
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class _TimeUnitDropDown extends StatefulWidget {
  const _TimeUnitDropDown({
    required this.frequencyTime,
  });
  final ValueNotifier<BeeDeviceFrequencySavingEntity> frequencyTime;

  @override
  State<_TimeUnitDropDown> createState() => _TimeUnitDropDownState();
}

class _TimeUnitDropDownState extends State<_TimeUnitDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<BeeDeviceFrequencyTimeUnit>(
      value: widget.frequencyTime.value.timeUnit,
      items: BeeDeviceFrequencyTimeUnit.values
          .map(
            (unit) => DropdownMenuItem<BeeDeviceFrequencyTimeUnit>(
              value: unit,
              child: Text(
                unit.text,
              ),
            ),
          )
          .toList(),
      onChanged: (unit) {
        if (unit != null) {
          setState(() {
            widget.frequencyTime.value = widget.frequencyTime.value.copyWith(
              timeUnit: unit,
            );
          });
        }
      },
    );
  }
}

extension _TimeUnitInfo on BeeDeviceFrequencyTimeUnit {
  String get text {
    switch (this) {
      case BeeDeviceFrequencyTimeUnit.seconds:
        return Strings.saveDeviceFormDeviceUpdateTimeSeconds;
      case BeeDeviceFrequencyTimeUnit.minutes:
        return Strings.saveDeviceFormDeviceUpdateTimeMinutes;
      case BeeDeviceFrequencyTimeUnit.hours:
        return Strings.saveDeviceFormDeviceUpdateTimeHours;
      case BeeDeviceFrequencyTimeUnit.days:
        return Strings.saveDeviceFormDeviceUpdateTimeDays;
    }
  }
}
