import 'dart:convert';

import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_dto.dart';
import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_with_ip_dto.dart';
import 'package:apicultores_app/features/devices/my_devices/data/exceptions/bee_device_connection_exceptions.dart';
import 'package:apicultores_app/features/graphs/data/dtos/graph_data_dto.dart';
import 'package:apicultores_app/features/graphs/data/dtos/graph_properties_dto.dart';
import 'package:apicultores_app/shared/adapter/network_discover.dart';
import 'package:http/http.dart' as http;

class BeeDeviceConnectionDataSource {
  Future<void> sendBeeDeviceData({
    required BeeDeviceDTO beeDeviceDTO,
    required String deviceIp,
  }) async {
    final response = await http.post(
      Uri.parse('http://$deviceIp/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(beeDeviceDTO.toJson()),
    );
    if (response.statusCode != 200) {
      throw const BeeDeviceConnectionSendDataException();
    }
  }

  Future<GraphDataDTO> getGraphData(GraphPropertiesDTO propertiesDTO) {
    final dateQuery = propertiesDTO.period.endDate != null
        ? 'start=${propertiesDTO.period.startDate.millisecondsSinceEpoch}?end=${propertiesDTO.period.endDate?.microsecondsSinceEpoch}'
        : 'start=${propertiesDTO.period.startDate.millisecondsSinceEpoch}';
    final url = 'http://${propertiesDTO.device.deviceIp}/data?$dateQuery';
    return http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    ).then((value) {
      if (value.statusCode != 200) {
        throw const BeeDeviceConnectionGetDataException();
      }
      return GraphDataDTO.fromJson(jsonDecode(value.body));
    });
  }

  Stream<List<BeeDeviceWithIpDTO>> findDevicesWithIp(
      final String subnet) async* {
    final discoverStream = NetworkDiscover.discover(
      subnet,
      80,
    );
    final devices = <BeeDeviceWithIpDTO>[];
    await for (final networkAddress in discoverStream) {
      if (networkAddress.exists) {
        try {
          print("Trying to connect to ${networkAddress.ip}");
          final beeDeviceDTO = await getDeviceData(networkAddress.ip);
          devices.add(BeeDeviceWithIpDTO(
            beeDeviceDTO: beeDeviceDTO,
            deviceIp: networkAddress.ip,
          ));
          yield devices;
        } on Exception {
          continue;
        }
      }
    }
  }

  Future<BeeDeviceDTO> getDeviceData(String deviceIp) async {
    print("trying to connect to device");
    final response = await http.get(
      Uri.parse('http://$deviceIp/device'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );
    if (response.statusCode != 200) {
      print('Device not found because of ${response.statusCode}');
      throw const BeeDeviceConnectionGetDataException();
    }
    return BeeDeviceDTO.fromJson(jsonDecode(response.body));
  }

  Future<void> clearData(String deviceIp) async {
    final response = await http.get(
      Uri.parse('http://$deviceIp/clear'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );
    if (response.statusCode != 200) {
      throw const BeeDeviceConnectionClearDataException();
    }
  }

  Future<void> disconnect(String deviceIp) async {
    final response = await http.get(
      Uri.parse('http://$deviceIp/disconnect'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).timeout(
      const Duration(seconds: 1),
      onTimeout: () {
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );
    if (response.statusCode != 200) {
      throw const BeeDeviceConnectionDisconnectException();
    }
  }
}
