import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/local_devices/local_device_section_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/local_devices/local_devices_failure_widget.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyDevicesWidgetBuilder extends StatelessWidget {
  const MyDevicesWidgetBuilder({super.key, required this.navigation});
  final DevicesNavigationDelegate navigation;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyDevicesBloc, MyDevicesState>(
        builder: (context, state) {
      return switch (state) {
        MyDevicesInitial _ || MyDevicesLoading _ => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
        MyDevicesSuccess state => LocalDevicesSectionWidget(
            localDevices: state.devices,
            navigation: navigation,
          ),
        MyDevicesFailure _ => const LocalDevicesFailureWidget(),
      };
    });
  }
}
