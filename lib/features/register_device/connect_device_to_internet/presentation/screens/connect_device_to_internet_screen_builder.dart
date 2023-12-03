import 'package:apicultores_app/features/register_device/connect_device_to_internet/business_logic/bloc/connect_device_to_internet_bloc.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/states/connect_device_to_internet_failure_widget.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/states/connect_device_to_internet_loading_widget.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/states/connect_device_to_internet_success_widget.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/states/connect_device_to_internet_wi_fi_available_widget.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/states/connect_to_device_bluetooth_success_widget.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceToInternetScreenBuilder extends StatelessWidget {
  const ConnectDeviceToInternetScreenBuilder({
    super.key,
    required this.navigationDelegate,
  });
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConnectDeviceToInternetBloc,
        ConnectDeviceToInternetState>(
      listener: (context, state) async {
        if (state is ConnectDeviceToInternetSuccess) {
          if (state.possibleRegisteredDevice == null) {
            navigationDelegate.navigateToSaveDevice(state.deviceIp);
          }
        }
      },
      builder: (context, state) => switch (state) {
        ConnectDeviceToInternetSuccess state =>
          ConnectDeviceToInternetSuccessWidget(
            deviceIp: state.deviceIp,
            possibleRegisteredDevice: state.possibleRegisteredDevice,
            navigationDelegate: navigationDelegate,
          ),
        ConnectDeviceToInternetInitial state =>
          ConnectDeviceToInternetWiFiAvailableWidget(
            wifiName: state.wiFiName,
          ),
        ConnectDeviceToInternetLoading _ =>
          const ConnectDeviceToInternetLoadingWidget(),
        ConnectDeviceToInternetFailure _ =>
          const ConnectDeviceToInternetFailureWidget(),
        ConnectDeviceToInternetBluetoothAnswerSuccess _ =>
          const ConnectToDeviceBluetoothSuccessWidget(),
      },
    );
  }
}
