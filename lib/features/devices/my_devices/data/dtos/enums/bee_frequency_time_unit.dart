import 'package:json_annotation/json_annotation.dart';

enum BeeDeviceFrequencyTimeUnit {
  @JsonValue('SECONDS')
  seconds,
  @JsonValue('MINUTES')
  minutes,
  @JsonValue('HOURS')
  hours,
  @JsonValue('DAYS')
  days,
}
