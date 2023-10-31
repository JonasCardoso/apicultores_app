part of 'save_device_form_widget.dart';

class _SaveDeviceUpdateTime extends StatelessWidget {
  const _SaveDeviceUpdateTime({
    required this.frequencyTime,
  });
  final _FrequencyTime frequencyTime;
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
        Row(
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
        )
      ],
    );
  }
}

class _NumberTextField extends StatelessWidget {
  _NumberTextField({required this.frequencyTime})
      : controller = TextEditingController(
          text: frequencyTime.time.toString(),
        );
  final _FrequencyTime frequencyTime;
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
          frequencyTime.time = int.parse(value);
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
  const _TimeUnitDropDown({required this.frequencyTime});
  final _FrequencyTime frequencyTime;

  @override
  State<_TimeUnitDropDown> createState() => _TimeUnitDropDownState();
}

class _TimeUnitDropDownState extends State<_TimeUnitDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<BeeDeviceFrequencyTimeUnit>(
      value: widget.frequencyTime.timeUnit,
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
            widget.frequencyTime.timeUnit = unit;
          });
        }
      },
    );
  }
}

class _FrequencyTime {
  late int time = 15;
  late BeeDeviceFrequencyTimeUnit timeUnit = BeeDeviceFrequencyTimeUnit.minutes;
  _FrequencyTime();

  BeeDeviceFrequencySavingEntity toEntity() => BeeDeviceFrequencySavingEntity(
        timeValue: time,
        timeUnit: timeUnit,
      );
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
