import 'package:apicultores_app/features/devices/my_devices/business_logic/bloc/my_devices_bloc.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalDevicesFailureWidget extends StatelessWidget {
  const LocalDevicesFailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(slivers: [
      Text(
        "Algo deu errado em encontrar seus dispositivos...",
        style: MyTypography.h1,
      ),
      Button(
          label: "Tente novamente",
          onPressed: () {
            BlocProvider.of<MyDevicesBloc>(context)
                .add(const MyDevicesLocalFetched());
          })
    ]);
  }
}
