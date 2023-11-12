import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/available_wifi/wi_fi_guard_waiting_widget.dart';
import 'package:apicultores_app/features/register_device/connect_device_to_internet/presentation/widgets/states/connect_device_to_internet_off_widget.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/business_logic/bloc/wi_fi_connection_bloc.dart';
import 'package:apicultores_app/features/register_device/wi_fi_connection/presentation/widgets/wi_fi_connection_bloc_provider.dart';
import 'package:apicultores_app/features/services/location_picker/business_logic/bloc/location_picker_bloc.dart';
import 'package:apicultores_app/features/services/location_picker/presentation/widgets/states/location_picker_denied_forever_widget.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceToInternetWiFiGuard extends StatelessWidget {
  const ConnectDeviceToInternetWiFiGuard({
    super.key,
    required this.buildChild,
  });
  final Widget Function(String wiFiName) buildChild;
  @override
  Widget build(BuildContext context) {
    return WiFiConnectionBlocProvider(
        child: BlocBuilder<WiFiConnectionBloc, WiFiConnectionState>(
      builder: (context, state) => switch (state) {
        WiFiConnectionWaiting _ => WiFiGuardWaitingWidget(
            state: state,
          ),
        WiFiConnectionOff _ => const ConnectDeviceToInternetOffWidget(),
        WiFiConnectionSuccess state => buildChild(state.wiFiName),
        WiFiConnectionFailure _ => FeedBackBanner(
            icon: Icons.error_outline,
            title: Strings.connectDeviceToInternetWiFiFailureTitle,
            description: Strings.connectDeviceToInternetOffSubtitle,
            buttonLabel: Strings.connectDeviceToInternetOffButtonLabel,
            onButtonClick: () {
              BlocProvider.of<WiFiConnectionBloc>(context).add(
                WiFiConnectionFetched(),
              );
            },
          ),
        WiFiLocationPermissionDeny _ => FeedBackBanner(
            icon: Icons.location_off_outlined,
            iconColor: SurfaceColor.error,
            title: Strings.locationPickerDeniedTitle,
            description: Strings.locationPickerDeniedSubtitle,
            buttonLabel: Strings.locationPickerDeniedButtonLabel,
            onButtonClick: () {
              BlocProvider.of<WiFiConnectionBloc>(context).add(
                WiFiLocationSettingsOpened(),
              );
            },
          ),
        WiFiLocationNeedsPermission _ => FeedBackBanner(
            icon: Icons.location_on,
            iconColor: SurfaceColor.primary,
            title: "Precisamos de sua localização para encontrar dispositivos!",
            description:
                "Clique no botão abaixo para permitir o uso da localização, com isso será possível encontrar dispositivos disponíveis na sua rede!",
            buttonLabel: "Ativar localização",
            onButtonClick: () {
              BlocProvider.of<WiFiConnectionBloc>(context).add(
                WiFiLocationPermissionAsked(),
              );
            }),
      },
    ));
  }
}
