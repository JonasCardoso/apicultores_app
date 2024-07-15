import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/internet_devices_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetDevicesFailureWidget extends StatelessWidget {
  const InternetDevicesFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const MyIcon(Icons.wifi_off, color: SurfaceColor.error),
                const SizedBox(
                  width: Spacing.small,
                ),
                Text(
                  "Algo deu errado ao procurar na sua internet...",
                  style: MyTypography.bodyRegular,
                ),
              ],
            ),
            const SizedBox(
              height: Spacing.medium,
            ),
            Button(
                label: "Tente novamente",
                fill: true,
                onPressed: () {
                  BlocProvider.of<InternetDevicesBloc>(context)
                      .add(const InternetDevicesFetched());
                })
          ],
        ),
      ),
    ]);
  }
}
