import 'package:apicultores_app/features/dataFirebase/presentation/widgets/datafb_scaffold.dart';
import 'package:design_system/design_system.dart';

class DatafbScreenBuilder extends StatelessWidget {
  const DatafbScreenBuilder({
    super.key,
  });

  // DEFINE SE MOSTRA GRAFICO OU TELA DE ERRO

  @override
  Widget build(BuildContext context) {
    return const Text("textoooo");
    //return DatafbScaffold(body: "null");
  }
}


// Widget build(BuildContext context) {
//   return BlocBuilder<MyDevicesBloc, MyDevicesState>(
//       builder: (context, state) {
//         return switch (state) {
//           MyDevicesLoading _ ||
//           MyDevicesInitial _ =>
//           const Center(child: CircularProgressIndicator()),
//           MyDevicesSuccess state => GraphsSuccessScreen(
//             connectedDevices: state.devices
//                 .where(
//                   (device) => device.status == LocalBeeDeviceStatus.connected,
//             )
//                 .toList(),
//             navigation: navigation,
//           ),
//           MyDevicesFailure _ => const GraphsFailureScreen(),
//         };
//       });
// }