part of 'save_device_bloc.dart';

sealed class SaveDeviceEvent extends Equatable {
  const SaveDeviceEvent();

  @override
  List<Object> get props => [];
}

final class SaveDeviceStarted extends SaveDeviceEvent {
  final BeeDeviceEntity beeDeviceEntity;
  const SaveDeviceStarted({
    required this.beeDeviceEntity,
  });

  @override
  List<Object> get props => [
        beeDeviceEntity,
      ];
}
