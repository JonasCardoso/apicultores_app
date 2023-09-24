import 'package:apicultores_app/features/devices/find_new_devices/presentation/bloc/connect_device_bloc/connect_device_bloc.dart';
import 'package:apicultores_app/features/devices/find_new_devices/presentation/widgets/device_widgets/bluetooth_device_card_bloc_provider.dart';
import 'package:apicultores_app/features/devices/find_new_devices/presentation/widgets/device_widgets/bluetooth_device_card_widget.dart';
import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/devices/shared/devices_navigation_delegate.dart';
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
    return BluetoothDeviceCardBlocProvider(
      scanResult: scanResult,
      child: BlocConsumer<ConnectDeviceBloc, ConnectDeviceState>(
          listener: (context, state) async {
            if (state is ConnectDeviceSuccess) {
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
                onTap: state is ConnectDeviceSuccess
                    ? null
                    : () {
                        context
                            .read<ConnectDeviceBloc>()
                            .add(ConnectDeviceStarted());
                      },
                leading: switch (state) {
                  ConnectDeviceInitial _ => const SizedBox(),
                  ConnectDeviceLoading _ => const SizedBox(
                      height: Spacing.large,
                      width: Spacing.large,
                      child: CircularProgressIndicator(),
                    ),
                  ConnectDeviceSuccess _ => const Icon(
                      Icons.check,
                      color: SurfaceColor.success,
                    ),
                  ConnectDeviceFailure _ => const Icon(
                      Icons.error_outline,
                      color: SurfaceColor.error,
                    ),
                },
              )),
    );
  }
}
