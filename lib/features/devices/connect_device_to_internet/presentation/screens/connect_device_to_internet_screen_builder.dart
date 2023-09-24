import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/bloc/connect_device_to_internet_bloc.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/widgets/states/connect_device_to_internet_failure_widget.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/widgets/states/connect_device_to_internet_off_widget.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/widgets/states/connect_device_to_internet_waiting_widget.dart';
import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/widgets/states/connect_device_to_internet_wi_fi_available_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceToInternetScreenBuilder extends StatelessWidget {
  const ConnectDeviceToInternetScreenBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectDeviceToInternetBloc,
            ConnectDeviceToInternetState>(
        builder: (context, state) => switch (state) {
              ConnectDeviceToInternetWaiting _ =>
                ConnectDeviceToInternetWaitingWidget(
                  state: state,
                ),
              ConnectDeviceToInternetWiFiOff _ =>
                const ConnectDeviceToInternetOffWidget(),
              ConnectDeviceToInternetFailure _ =>
                ConnectDeviceToInternetFailureWidget(
                  state: state,
                ),
              ConnectDeviceToInternetWifiAvailable state =>
                ConnectDeviceToInternetWiFiAvailableWidget(
                    wifiName: state.wiFiName),
            });
  }
}
