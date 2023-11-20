import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/internet_devices/internet_devices_widget_builder.dart';
import 'package:apicultores_app/features/devices/my_devices/presentation/widgets/local_devices/local_devices_widget_builder.dart';
import 'package:apicultores_app/features/register_device/shared/devices_navigation_delegate.dart';
import 'package:design_system/design_system.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesScreenBuilder extends StatelessWidget {
  const DevicesScreenBuilder({
    super.key,
    required this.navigationDelegate,
  });
  final DevicesNavigationDelegate navigationDelegate;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<MyDevicesBloc>(context)
            .add(const MyDevicesLocalFetched());
      },
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: Spacing.large,
            ),
          ),
          _SectionTitle(
            text: 'Meus dispositivos',
            leading: IconButton(
                icon: Icons.add,
                onPressed: () {
                  navigationDelegate.navigateToFindDevices();
                }),
          ),
          MyDevicesWidgetBuilder(
            navigation: navigationDelegate,
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: Spacing.medium,
                ),
                Divider(),
                SizedBox(
                  height: Spacing.medium,
                )
              ],
            ),
          ),
          const _SectionTitle(text: 'Depositivos on-line'),
          const InternetDevicesWidgetBuilder(),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.text,
    this.leading,
  });
  final String text;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    final leading = this.leading;
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                style: MyTypography.h4Strong,
              ),
              if (leading != null) leading,
            ],
          ),
          const SizedBox(
            height: Spacing.medium,
          ),
        ],
      ),
    );
  }
}
