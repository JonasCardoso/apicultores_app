import 'dart:async';
import 'dart:io';

import 'package:design_system/design_system.dart';

class DataChunksCollector {
  Future<String> collectDataChunks({required ip, required query}) async {
    final completer = Completer<String>();
    final Socket socket = await Socket.connect(
      ip,
      80,
      timeout: const Duration(seconds: 5),
    );
    var finalData = '';
    print("query: $query");
    socket.write('GET /$query HTTP/1.1\r\nHost: $ip\r\n\r\n');
    socket.listen(
      (event) {
        final response = String.fromCharCodes(event);
        if (response.contains('1.1')) {
          print('http response: $response');
        }

        finalData += response;
      },
      onDone: () {
        debugPrint('Conexão fechada pelo servidor');
        socket.destroy();
        completer.complete(finalData);
      },
      onError: (error) {
        debugPrint('Erro na conexão: $error');
        completer.completeError(error);
      },
      cancelOnError: true,
    );
    return completer.future;
  }
}
