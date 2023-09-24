import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/bloc/connect_device_to_internet_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class ConnectDeviceToInternetWaitingWidget extends StatelessWidget {
  const ConnectDeviceToInternetWaitingWidget({
    super.key,
    required this.state,
  });
  final ConnectDeviceToInternetWaiting state;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: Spacing.xxlarge,
            width: Spacing.xxlarge,
            child: CircularProgressIndicator(),
          ),
          const SizedBox(
            height: Spacing.large,
          ),
          Text(
            switch (state) {
              ConnectDeviceToInternetFindingWiFi _ =>
                Strings.connectDeviceToInternetFindingWifiTitle,
              ConnectDeviceToInternetWiFiLoading _ =>
                Strings.connectDeviceToInternetLoadingWifiTitle,
            },
            style: MyTypography.p,
          )
        ],
      ),
    );
  }
}
