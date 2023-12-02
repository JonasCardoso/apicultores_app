import 'package:apicultores_app/features/graphs/data/dtos/graph_data_dto.dart';
import 'package:apicultores_app/features/graphs/business_logic/entities/sensor_type.dart';
import 'package:equatable/equatable.dart';

class GraphDataEntity extends Equatable {
  final List<DateTime?> timestamps;
  final Map<SensorType, List<double?>> data;

  const GraphDataEntity({
    required this.timestamps,
    required this.data,
  });

  factory GraphDataEntity.fromDTO(GraphDataDTO dto) {
    return GraphDataEntity(
        timestamps: dto.timestamps.map<DateTime?>((timestamp) {
          // print(
          //     'timestamp from converter: $timestamp ${DateTime.fromMillisecondsSinceEpoch(int.tryParse(timestamp ?? '') ?? 0)}');
          final possibleTimestamp = int.tryParse(timestamp ?? '');
          return possibleTimestamp != null
              ? DateTime.fromMillisecondsSinceEpoch(possibleTimestamp)
              : null;
        }).toList(),
        data: {
          SensorType.externalSound: dto.externalSoundReadings.convertToDouble(),
          SensorType.internalSound: dto.internalSoundReadings.convertToDouble(),
          SensorType.proximity: dto.proximityReadings.convertToDouble(),
        });
  }

  List<List<dynamic>> transformDataInCSV() {
    final csvData = <List<dynamic>>[];
    csvData.add(['timestamp', ...SensorType.values.map((e) => e.name)]);
    for (var i = 0; i < timestamps.length; i++) {
      final timestamp = timestamps[i];
      final proximity = data[SensorType.proximity]?[i];
      final internalSound = data[SensorType.internalSound]?[i];
      final externalSound = data[SensorType.externalSound]?[i];
      csvData.add([
        timestamp?.millisecondsSinceEpoch,
        proximity,
        internalSound,
        externalSound,
      ]);
    }
    return csvData;
  }

  @override
  List<Object?> get props => [
        timestamps,
        data,
      ];
}

extension on List<String?> {
  List<double?> convertToDouble() {
    return map<double?>((value) {
      final possibleValue = double.tryParse(value ?? '');
      return possibleValue;
    }).toList();
  }
}
