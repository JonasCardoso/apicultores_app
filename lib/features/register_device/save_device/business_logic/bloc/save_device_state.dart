part of 'save_device_bloc.dart';

sealed class SaveDeviceState extends Equatable {
  const SaveDeviceState();

  @override
  List<Object> get props => [];
}

final class SaveDeviceInitial extends SaveDeviceState {}

final class SaveDeviceLoading extends SaveDeviceState {}

final class SaveDeviceFailure extends SaveDeviceState {
  final BeeDeviceEntity beeDeviceEntity;

  const SaveDeviceFailure({
    required this.beeDeviceEntity,
  });

  @override
  List<Object> get props => [
        beeDeviceEntity,
      ];
}

final class SaveDeviceSuccess extends SaveDeviceState {}
