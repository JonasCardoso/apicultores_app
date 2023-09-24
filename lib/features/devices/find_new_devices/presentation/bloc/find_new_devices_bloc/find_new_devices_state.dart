part of 'find_new_devices_bloc.dart';

sealed class FindNewDevicesState extends Equatable {
  const FindNewDevicesState();

  @override
  List<Object> get props => [];
}

final class FindNewDevicesInitial extends FindNewDevicesState {}

final class FindNewDevicesInactiveBluetooth extends FindNewDevicesState {}

final class FindNewDevicesUnavailableBluetooth extends FindNewDevicesState {}

final class FindNewDevicesSearching extends FindNewDevicesState {
  const FindNewDevicesSearching(this.scanResults);

  final List<BluetoothDeviceEntity> scanResults;

  @override
  List<Object> get props => [scanResults];
}

final class FindNewDevicesFailure extends FindNewDevicesState {
  const FindNewDevicesFailure({
    required this.error,
  });

  final Exception error;

  @override
  String toString() {
    return 'FindNewDevicesFailure{error: $error}';
  }

  @override
  List<Object> get props => [error];
}

final class FindNewDevicesStopSearch extends FindNewDevicesState {
  const FindNewDevicesStopSearch({
    required this.scanResults,
  });

  final List<BluetoothDeviceEntity> scanResults;

  @override
  List<Object> get props => [scanResults];
}
