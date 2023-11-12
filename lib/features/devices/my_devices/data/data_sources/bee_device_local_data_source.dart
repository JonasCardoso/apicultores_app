import 'dart:convert';

import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_dto.dart';
import 'package:apicultores_app/features/devices/my_devices/data/dtos/bee_device_with_ip_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:collection/collection.dart';

class BeeDeviceLocalDataSource {
  BeeDeviceLocalDataSource();

  Future<List<BeeDeviceWithIpDTO>> getDevices() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final devices = sharedPreferences.getStringList('devices');
    if (devices == null) {
      return [];
    }
    return devices
        .map(
          (e) => BeeDeviceWithIpDTO.fromJson(
            json.decode(e),
          ),
        )
        .toList();
  }

  Future<void> saveDevice(BeeDeviceWithIpDTO beeDeviceDTO) async {
    final devices = await getDevices();
    final sharedPreferences = await SharedPreferences.getInstance();
    final BeeDeviceWithIpDTO? alreadySavedDevice = devices.firstWhereOrNull(
      (element) => element.beeDeviceDTO.id == beeDeviceDTO.beeDeviceDTO.id,
    );
    final deviceIsNotSaved = alreadySavedDevice != beeDeviceDTO;
    final savedDeviceNeedsUpdate =
        alreadySavedDevice?.beeDeviceDTO.id == beeDeviceDTO.beeDeviceDTO.id &&
            alreadySavedDevice != beeDeviceDTO;
    if (savedDeviceNeedsUpdate) {
      final index = devices.indexWhere(
          (element) => element.beeDeviceDTO.id == beeDeviceDTO.beeDeviceDTO.id);
      devices[index] = beeDeviceDTO;
      await sharedPreferences.setStringList(
        'devices',
        devices.map<String>((e) => json.encode(e.toJson())).toList(),
      );
    } else if (deviceIsNotSaved) {
      devices.add(beeDeviceDTO);
      await sharedPreferences.setStringList(
        'devices',
        devices.map<String>((e) => json.encode(e.toJson())).toList(),
      );
    }
  }
}
