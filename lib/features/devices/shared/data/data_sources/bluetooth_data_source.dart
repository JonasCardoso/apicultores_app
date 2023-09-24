import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothDataSource {
  Future<bool> isBluetoothAvailable() => FlutterBluePlus.isAvailable;

  //Android Only
  Future<void> turnOnBluetooth() async {
    await FlutterBluePlus.turnOn();
  }

  Future<void> startScan(Duration timeout) async {
    await FlutterBluePlus.startScan(timeout: timeout);
  }

  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  Stream<BluetoothAdapterState> get state => FlutterBluePlus.adapterState;

  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;

  Stream<bool> get isScanning => FlutterBluePlus.isScanning;
}
