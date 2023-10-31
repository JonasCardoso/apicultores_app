import 'package:apicultores_app/features/register_device/wi_fi_connection/business_logic/bloc/wi_fi_connection_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceToInternetOffWidget extends StatelessWidget {
  const ConnectDeviceToInternetOffWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.wifi_off,
      iconColor: SurfaceColor.error,
      title: Strings.connectDeviceToInternetOffTitle,
      description: Strings.connectDeviceToInternetOffSubtitle,
      buttonLabel: Strings.connectDeviceToInternetOffButtonLabel,
      onButtonClick: () {
        BlocProvider.of<WiFiConnectionBloc>(context)
            .add(WiFiConnectionFetched());
      },
    );
  }
}
