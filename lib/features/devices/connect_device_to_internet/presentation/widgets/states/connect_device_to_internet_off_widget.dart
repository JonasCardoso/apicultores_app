import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/bloc/connect_device_to_internet_bloc.dart';
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
        BlocProvider.of<ConnectDeviceToInternetBloc>(context)
            .add(ConnectDeviceToInternetFetched());
      },
    );
  }
}
