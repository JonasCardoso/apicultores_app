class BeeDeviceConnectionException implements Exception {
  const BeeDeviceConnectionException({
    required this.message,
  });
  final String message;
}

class BeeDeviceConnectionSendDataException
    extends BeeDeviceConnectionException {
  const BeeDeviceConnectionSendDataException()
      : super(
          message: 'Failed to send data to device',
        );
}

class BeeDeviceConnectionGetDataException extends BeeDeviceConnectionException {
  const BeeDeviceConnectionGetDataException()
      : super(
          message: 'Failed to get data from device',
        );
}

class BeeDeviceConnectionResetDataException
    extends BeeDeviceConnectionException {
  const BeeDeviceConnectionResetDataException()
      : super(
          message: 'Failed to reset data from device',
        );
}
