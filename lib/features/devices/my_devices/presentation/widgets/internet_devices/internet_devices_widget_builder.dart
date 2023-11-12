import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/internet_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/internet_devices/internet_devices_failure_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/internet_devices/internet_devices_search_widget.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/internet_devices/internet_devices_section_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetDevicesWidgetBuilder extends StatelessWidget {
  const InternetDevicesWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetDevicesBloc, InternetDevicesState>(
        builder: (context, state) {
      return switch (state) {
        InternetDevicesInitial _ => const InternetDevicesSearchWidget(),
        InternetDevicesSearching state => InternetDevicesSectionWidget(
            internetDevices: state.internetDevices,
            isLoading: true,
          ),
        InternetDevicesSuccess state => InternetDevicesSectionWidget(
            internetDevices: state.internetDevices,
            isLoading: false,
          ),
        InternetDevicesFailure _ => const InternetDevicesFailureWidget(),
      };
    });
  }
}
