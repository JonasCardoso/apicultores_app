import 'package:apicultores_app/features/register_device/connect_device_to_internet/business_logic/bloc/connect_device_to_internet_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceToInternetFailureWidget extends StatelessWidget {
  const ConnectDeviceToInternetFailureWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context) => FeedBackBanner(
        icon: Icons.error_outline,
        title: Strings.connectDeviceToInternetFailureTitle,
        description: Strings.connectDeviceToInternetFailureDescription,
        buttonLabel: Strings.tryAgain,
        onButtonClick: () {
          BlocProvider.of<ConnectDeviceToInternetBloc>(context).add(
            const ConnectDeviceToInternetRetryTapped(),
          );
        },
      );
}
