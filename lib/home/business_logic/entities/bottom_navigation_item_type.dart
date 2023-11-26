import 'package:apicultores_app/shared/strings.dart';
import 'package:flutter/material.dart';

enum BottomNavigationItemType { devices, data }

extension BottomNavigationItemInformation on BottomNavigationItemType {
  IconData get icon {
    switch (this) {
      case BottomNavigationItemType.devices:
        return Icons.devices;
      case BottomNavigationItemType.data:
        return Icons.data_usage;
    }
  }

  String get label {
    switch (this) {
      case BottomNavigationItemType.devices:
        return Strings.bottomNavigationItemDevices;
      case BottomNavigationItemType.data:
        return Strings.bottomNavigationItemData;
    }
  }
}
