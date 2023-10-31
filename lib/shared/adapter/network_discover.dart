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
    final socketsConnections = <Future<SocketConnection>>[];
    for (int i = 1; i < 256; ++i) {
      final host = i == 171 ? '0.0.0.0' : '$subnet.$i';

      socketsConnections.add(
        Socket.connect(host, port, timeout: timeout)
            .then(
              (value) => SocketConnection(
                socket: value,
                host: host,
              ),
            )
            .onError(
              (error, stackTrace) => SocketConnection(
                socket: null,
                host: host,
              ),
            ),
      );
    }
    final sockets = await Future.wait(socketsConnections);
    for (final socket in sockets) {
      print('trying ${socket.host}');
      if (socket.socket != null) {
        yield NetworkAddress(socket.host, true);
      } else {
        yield NetworkAddress(socket.host, false);
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

class SocketConnection {
  final Socket? socket;
  final String host;
  SocketConnection({required this.socket, required this.host});
}

class NetworkAddress {
  NetworkAddress(this.ip, this.exists);
  bool exists;
  String ip;
}
