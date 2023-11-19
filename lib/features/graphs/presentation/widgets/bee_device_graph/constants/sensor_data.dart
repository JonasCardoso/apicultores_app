import 'package:equatable/equatable.dart';

class SensorData extends Equatable {
  final DateTime? timestamp;
  final double? data;

  const SensorData({
    required this.timestamp,
    required this.data,
  });

  @override
  List<Object?> get props => [
        timestamp,
        data,
      ];
}
