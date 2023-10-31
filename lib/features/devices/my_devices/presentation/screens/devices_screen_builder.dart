import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_empty_screen.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_failure_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_searching/devices_searching_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/devices_success/devices_success_widget.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesScreenBuilder extends StatelessWidget {
  const DevicesScreenBuilder({
    super.key,
    required this.navigationDelegate,
  });
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDevicesBloc, MyDevicesState>(
        builder: (context, state) {
      return switch (state) {
        MyDevicesInitial _ => Container(),
        MyDevicesEmpty _ => DevicesEmptyScreen(
            navigationDelegate: navigationDelegate,
          ),
        MyDevicesSearching state => DevicesSearchingWidget(
            navigationDelegate: navigationDelegate,
            devices: state.devices,
          ),
        MyDevicesSuccess state => MyDevicesSuccessWidget(
            devices: state.devices,
            navigationDelegate: navigationDelegate,
          ),
        MyDevicesFailure _ => const DevicesFailureWidget(),
      };
    });
  }
}
