import 'package:apicultores_app/features/register_device/connect_device_to_internet/business_logic/bloc/connect_device_to_internet_bloc.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/available_wifi/available_wifi_feed_back_widget.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/available_wifi/available_wifi_password_input_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceToInternetWiFiAvailableWidget extends StatelessWidget {
  ConnectDeviceToInternetWiFiAvailableWidget(
      {super.key, required this.wifiName});
  final String wifiName;

  final TextEditingController _wiFiPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AvailableWiFiFeedBackWidget(wifiName: wifiName),
            AvailableWiFiPasswordInputWidget(
              formKey: _formKey,
              passwordController: _wiFiPasswordController,
            ),
            const SizedBox(
              height: Spacing.large,
            ),
            Button(
              label: "Conectar",
              fill: true,
              onPressed: () => connectDeviceToInternet(context),
            )
          ],
        ),
      ),
    );
  }

  void connectDeviceToInternet(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<ConnectDeviceToInternetBloc>(context).add(
        ConnectDeviceToInternetStarted(
          wiFiName: wifiName,
          wiFiPassword: _wiFiPasswordController.text,
        ),
      );
    }
  }
}
