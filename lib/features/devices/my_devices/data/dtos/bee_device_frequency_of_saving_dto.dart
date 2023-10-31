import 'package:apicultores_app/features/devices/my_devices/data/dtos/enums/bee_frequency_time_unit.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bee_device_frequency_of_saving_dto.g.dart';

@JsonSerializable()
class BeeDeviceFrequencyOfSavingDTO extends Equatable {
  final BeeDeviceFrequencyTimeUnit timeUnit;
  final int timeValue;

  const BeeDeviceFrequencyOfSavingDTO({
    required this.timeUnit,
    required this.timeValue,
  });

  factory BeeDeviceFrequencyOfSavingDTO.fromJson(Map<String, dynamic> json) =>
      _$BeeDeviceFrequencyOfSavingDTOFromJson(json);

  Map<String, dynamic> toJson() => _$BeeDeviceFrequencyOfSavingDTOToJson(this);

  @override
  List<Object?> get props => [
        timeUnit,
        timeValue,
      ];
}
