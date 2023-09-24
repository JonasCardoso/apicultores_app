part of 'connect_device_bloc.dart';

sealed class ConnectDeviceState extends Equatable {
  const ConnectDeviceState();

  @override
  List<Object> get props => [];
}

final class ConnectDeviceInitial extends ConnectDeviceState {}

final class ConnectDeviceLoading extends ConnectDeviceState {}

final class ConnectDeviceSuccess extends ConnectDeviceState {}

final class ConnectDeviceFailure extends ConnectDeviceState {
  const ConnectDeviceFailure({
    required this.error,
  });

  final Exception error;

  @override
  String toString() {
    return 'ConnectDeviceFailure{error: $error}';
  }

  @override
  List<Object> get props => [error];
}
