import 'package:apicultores_app/features/register_device/find_new_devices/business_logic/bloc/find_new_devices_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FindNewDevicesEmptyWidget extends StatelessWidget {
  const FindNewDevicesEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FeedBackBanner(
      icon: Icons.bluetooth_searching,
      title: Strings.findNewDevicesEmptyTitle,
      description: Strings.findNewDevicesEmptyDescription,
      buttonLabel: Strings.findNewDevicesEmptyButtonLabel,
      onButtonClick: () {
        BlocProvider.of<FindNewDevicesBloc>(context).add(
          FindNewDevicesScanStarted(),
        );
      },
    );
  }
}
