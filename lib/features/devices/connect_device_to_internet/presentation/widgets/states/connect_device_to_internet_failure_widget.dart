import 'package:apicultores_app/features/devices/connect_device_to_internet/presentation/bloc/connect_device_to_internet_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:apicultores_app/shared/widgets/error_feed_back_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectDeviceToInternetFailureWidget extends StatelessWidget {
  const ConnectDeviceToInternetFailureWidget({
    super.key,
    required this.state,
  });
  final ConnectDeviceToInternetFailure state;
  @override
  Widget build(BuildContext context) => switch (state) {
        ConnectDeviceToInternetGenericFailure _ =>
          ErrorFeedBackWidget(onButtonClick: () {
            BlocProvider.of<ConnectDeviceToInternetBloc>(context).add(
              ConnectDeviceToInternetFetched(),
            );
          }),
        ConnectDeviceToInternetWiFiFailure _ => FeedBackBanner(
            icon: Icons.error_outline,
            title: Strings.connectDeviceToInternetWiFiFailureTitle,
            description: Strings.connectDeviceToInternetOffSubtitle,
            buttonLabel: Strings.connectDeviceToInternetOffButtonLabel,
            onButtonClick: () {
              BlocProvider.of<ConnectDeviceToInternetBloc>(context).add(
                ConnectDeviceToInternetFetched(),
              );
            }),
      };
}
