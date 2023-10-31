import 'package:apicultores_app/features/register_device/device_bluetooth_connection/business_logic/bloc/device_bluetooth_connection_bloc.dart';
import 'package:apicultores_app/features/register_device/device_bluetooth_connection/presentation/widgets/device_bluetooth_connection_bloc_provider.dart';
import 'package:apicultores_app/features/register_device/find_new_devices/presentation/widgets/device_widgets/bluetooth_device_card_widget.dart';
import 'package:apicultores_app/features/register_device/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BluetoothDeviceCardWidgetBuilder extends StatelessWidget {
  const BluetoothDeviceCardWidgetBuilder({
    super.key,
    required this.scanResult,
    required this.navigationDelegate,
  });

  final BluetoothDeviceEntity scanResult;
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return DeviceBluetoothConnectionBlocProvider(
      deviceEntity: scanResult,
      child: BlocConsumer<DeviceBluetoothConnectionBloc,
              DeviceBluetoothConnectionState>(
          listener: (context, state) async {
            if (state is DeviceBluetoothConnectionSuccess) {
              await Future.delayed(
                const Duration(microseconds: 500),
              );
              navigationDelegate.navigateToConnectDeviceToInternet(scanResult);
            }
          },
          builder: (context, state) => BluetoothDeviceCardWidget(
                name: scanResult.name,
                remoteId: scanResult.remoteId,
                type: scanResult.type,
                onTap: switch (state) {
                  DeviceBluetoothConnectionInitial _ ||
                  DeviceBluetoothConnectionLoading _ ||
                  DeviceBluetoothConnectionFailure _ =>
                    () {
                      BlocProvider.of<DeviceBluetoothConnectionBloc>(context)
                          .add(DeviceBluetoothConnectionStarted());
                    },
                  DeviceBluetoothConnectionConnectOn _ ||
                  DeviceBluetoothConnectionSuccess _ =>
                    () {
                      navigationDelegate.navigateToConnectDeviceToInternet(
                        scanResult,
                      );
                    },
                },
                leading: switch (state) {
                  DeviceBluetoothConnectionInitial _ => const SizedBox(),
                  DeviceBluetoothConnectionLoading _ => const SizedBox(
                      height: Spacing.large,
                      width: Spacing.large,
                      child: CircularProgressIndicator(),
                    ),
                  DeviceBluetoothConnectionConnectOn _ ||
                  DeviceBluetoothConnectionSuccess _ =>
                    const Icon(
                      Icons.check,
                      color: SurfaceColor.success,
                    ),
                  DeviceBluetoothConnectionFailure _ => const Icon(
                      Icons.error_outline,
                      color: SurfaceColor.error,
                    ),
                },
              )),
    );
  }
}
