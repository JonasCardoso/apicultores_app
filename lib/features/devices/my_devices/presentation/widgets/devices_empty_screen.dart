import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesEmptyScreen extends StatelessWidget {
  const DevicesEmptyScreen({
    super.key,
    required this.navigationDelegate,
  });
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox()),
        FeedBackBanner(
            icon: Icons.device_unknown_sharp,
            title: Strings.devicesEmptyScreenTitle,
            description: Strings.devicesEmptyDescription,
            buttonLabel: Strings.devicesEmptyButton,
            onButtonClick: () {
              navigationDelegate.navigateToFindDevices();
            }),
        const SizedBox(
          height: Spacing.small,
        ),
        Button(
          //TODO: Change text
          label: 'Procurar novamente',
          icon: Icons.search,
          fill: true,
          variant: ButtonVariant.secondary,
          onPressed: () => context.read<MyDevicesBloc>()
            ..add(
              const MyDevicesFetched(),
            ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
