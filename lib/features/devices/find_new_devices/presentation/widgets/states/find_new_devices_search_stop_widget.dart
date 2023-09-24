import 'package:apicultores_app/features/devices/find_new_devices/presentation/bloc/find_new_devices_bloc/find_new_devices_bloc.dart';
import 'package:apicultores_app/features/devices/shared/business_logic/entities/bluetooth_device_scan_result.dart';
import 'package:apicultores_app/features/devices/find_new_devices/presentation/widgets/devices_list/find_new_devices_empty_widget.dart';
import 'package:apicultores_app/features/devices/find_new_devices/presentation/widgets/devices_list/find_new_devices_list_widget.dart';
import 'package:apicultores_app/features/devices/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindNewDevicesSearchStopWidget extends StatelessWidget {
  const FindNewDevicesSearchStopWidget({
    super.key,
    required this.devices,
    required this.navigationDelegate,
  });
  final List<BluetoothDeviceEntity> devices;
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return devices.isEmpty
        ? const FindNewDevicesEmptyWidget()
        : CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: Spacing.medium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const MyIcon(
                                Icons.bluetooth,
                                color: Colors.blue,
                                iconSize: IconSize.medium,
                              ),
                              const SizedBox(
                                width: Spacing.medium,
                              ),
                              Expanded(
                                child: Text(
                                  Strings
                                      .findNewDevicesListWidgetStopSearchLabel,
                                  style: MyTypography.p,
                                ),
                              )
                            ],
                          ),
                        ),
                        Button(
                            label: Strings
                                .findNewDevicesListWidgetStopSearchButtonLabel,
                            onPressed: () {
                              BlocProvider.of<FindNewDevicesBloc>(context).add(
                                FindNewDevicesScanStarted(),
                              );
                            })
                      ],
                    ),
                    const SizedBox(
                      height: Spacing.medium,
                    ),
                  ],
                ),
              ),
              FindNewDevicesListWidget(
                devices: devices,
                navigationDelegate: navigationDelegate,
              ),
            ],
          );
  }
}
