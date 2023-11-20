import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_frequency_of_saving_dto.dart';
import 'package:apicultores_app/features/devices/my_devices/data/dtos/enums/bee_frequency_time_unit.dart';
import 'package:equatable/equatable.dart';

class BeeDeviceFrequencySavingEntity extends Equatable {
  final int timeValue;
  final BeeDeviceFrequencyTimeUnit timeUnit;

  const BeeDeviceFrequencySavingEntity({
    required this.timeValue,
    required this.timeUnit,
  });

  String get text {
    return '${timeValue.toString()} $_timeUnitText';
  }

  BeeDeviceFrequencySavingEntity copyWith({
    int? timeValue,
    BeeDeviceFrequencyTimeUnit? timeUnit,
  }) {
    return BeeDeviceFrequencySavingEntity(
      timeValue: timeValue ?? this.timeValue,
      timeUnit: timeUnit ?? this.timeUnit,
    );
  }

  String get _timeUnitText {
    switch (timeUnit) {
      case BeeDeviceFrequencyTimeUnit.seconds:
        return timeValue == 1 ? "segundo" : "segundos";
      case BeeDeviceFrequencyTimeUnit.minutes:
        return timeValue == 1 ? "minuto" : "minutos";
      case BeeDeviceFrequencyTimeUnit.hours:
        return timeValue == 1 ? "hora" : "horas";
      case BeeDeviceFrequencyTimeUnit.days:
        return timeValue == 1 ? "dia" : "dias";
    }
  }

  factory BeeDeviceFrequencySavingEntity.fromDTO(
          BeeDeviceFrequencyOfSavingDTO dto) =>
      BeeDeviceFrequencySavingEntity(
        timeValue: dto.timeValue,
        timeUnit: dto.timeUnit,
      );

  BeeDeviceFrequencyOfSavingDTO toDTO() => BeeDeviceFrequencyOfSavingDTO(
        timeValue: timeValue,
        timeUnit: timeUnit,
      );

  @override
  List<Object?> get props => [
        timeValue,
        timeUnit,
      ];
}
