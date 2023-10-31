import 'dart:async';
import 'dart:io';

class NetworkDiscover {
  static Stream<NetworkAddress> discover(
    String subnet,
    int port, {
    Duration timeout = const Duration(
      milliseconds: 200,
    ),
  }) async* {
    for (int i = 1; i < 256; ++i) {
      print('trying $subnet.$i');
      final host = '$subnet.$i';

      try {
        final Socket s = await Socket.connect(host, port, timeout: timeout);
        s.destroy();
        yield NetworkAddress(host, true);
      } catch (e) {
        if (e is! SocketException) {
          rethrow;
        }

        // Check if connection timed out or we got one of predefined errors
        if (e.osError == null || _errorCodes.contains(e.osError?.errorCode)) {
          yield NetworkAddress(host, false);
        } else {
          // Error 23,24: Too many open files in system
          rethrow;
        }
      }
    }
  }

  static Future<Socket> _ping(String host, int port, Duration timeout) {
    return Socket.connect(host, port, timeout: timeout).then((socket) {
      return socket;
    });
  }

  static final _errorCodes = [13, 49, 61, 64, 65, 101, 111, 113];
}

class NetworkAddress {
  NetworkAddress(this.ip, this.exists);
  bool exists;
  String ip;
}
