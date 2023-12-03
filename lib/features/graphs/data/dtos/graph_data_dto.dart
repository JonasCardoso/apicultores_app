import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graph_data_dto.g.dart';

@JsonSerializable()
class GraphDataDTO extends Equatable {
  final List<String?> timestamps;

  @JsonKey(name: 'internal_sound')
  final List<String?> internalSound;

  @JsonKey(name: 'external_sound')
  final List<String?> externalSound;

  final List<String?> proximity;

  @JsonKey(name: 'external_temperature')
  final List<String?> externalTemperature;

  @JsonKey(name: 'internal_temperature')
  final List<String?> internalTemperature;

  @JsonKey(name: 'external_humidity')
  final List<String?> externalHumidity;

  @JsonKey(name: 'internal_humidity')
  final List<String?> internalHumidity;

  @JsonKey(name: 'external_pressure')
  final List<String?> externalPressure;

  @JsonKey(name: 'internal_pressure')
  final List<String?> internalPressure;

  @JsonKey(name: 'external_gas')
  final List<String?> externalGas;

  @JsonKey(name: 'internal_gas')
  final List<String?> internalGas;

  const GraphDataDTO({
    required this.timestamps,
    required this.internalSound,
    required this.externalSound,
    required this.proximity,
    required this.internalTemperature,
    required this.externalTemperature,
    required this.internalHumidity,
    required this.externalHumidity,
    required this.internalPressure,
    required this.externalPressure,
    required this.internalGas,
    required this.externalGas,
  });

  factory GraphDataDTO.fromJson(Map<String, dynamic> json) {
    return _$GraphDataDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GraphDataDTOToJson(this);

  factory GraphDataDTO.fromCsv(List<List<dynamic>> csv) {
    print('csv: $csv');
    final timestamps = <String?>[];
    final internalSound = <String?>[];
    final externalSound = <String?>[];
    final proximity = <String?>[];
    final internalTemperature = <String?>[];
    final externalTemperature = <String?>[];
    final internalHumidity = <String?>[];
    final externalHumidity = <String?>[];
    final internalPressure = <String?>[];
    final externalPressure = <String?>[];
    final internalGas = <String?>[];
    final externalGas = <String?>[];
    for (var i = 0; i < csv.length; i++) {
      final row = csv[i];
      if (row.length == 12) {
        timestamps.add(row[0].toString());
        proximity.add(row[1].toString());
        internalSound.add(row[2].toString());
        externalSound.add(row[3].toString());
        internalTemperature.add(row[4].toString());
        externalTemperature.add(row[5].toString());
        internalHumidity.add(row[6].toString());
        externalHumidity.add(row[7].toString());
        internalPressure.add(row[8].toString());
        externalPressure.add(row[9].toString());
        internalGas.add(row[10].toString());
        externalGas.add(row[11].toString());
      }
    }
    return GraphDataDTO(
      timestamps: timestamps,
      internalSound: internalSound,
      externalSound: externalSound,
      proximity: proximity,
      internalTemperature: internalTemperature,
      externalTemperature: externalTemperature,
      internalHumidity: internalHumidity,
      externalHumidity: externalHumidity,
      internalPressure: internalPressure,
      externalPressure: externalPressure,
      internalGas: internalGas,
      externalGas: externalGas,
    );
  }

  @override
  List<Object?> get props => [
        timestamps,
        internalSound,
        externalSound,
        proximity,
        internalTemperature,
        externalTemperature,
        internalHumidity,
        externalHumidity,
        internalPressure,
        externalPressure,
        internalGas,
        externalGas,
      ];
}
