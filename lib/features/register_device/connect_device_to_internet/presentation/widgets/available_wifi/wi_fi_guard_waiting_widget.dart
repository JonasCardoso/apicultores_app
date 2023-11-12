import 'package:apicultores_app/features/register_device/wi_fi_connection/business_logic/bloc/wi_fi_connection_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

class WiFiGuardWaitingWidget extends StatelessWidget {
  const WiFiGuardWaitingWidget({
    super.key,
    required this.state,
  });
  final WiFiConnectionWaiting state;
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
              WiFiConnectionFinding _ =>
                Strings.connectDeviceToInternetFindingWifiTitle,
              WiFiConnectionLoadingInformation _ =>
                Strings.connectDeviceToInternetLoadingWifiTitle,
            },
            style: MyTypography.captionRegular,
          )
        ],
      ),
    );
  }
}
