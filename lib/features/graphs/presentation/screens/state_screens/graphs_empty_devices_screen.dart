import 'package:apicultores_app/features/graphs/presentation/navigation/graphs_navigation.dart';
import 'package:apicultores_app/features/graphs/presentation/widgets/graphs_scaffold.dart';
import 'package:design_system/design_system.dart';

class GraphsEmptyDevicesWidget extends StatelessWidget {
  const GraphsEmptyDevicesWidget({
    super.key,
    required this.navigation,
  });
  final GraphsNavigation navigation;
  @override
  Widget build(BuildContext context) {
    return GraphsScaffold(
        body: FeedBackBanner(
      icon: Icons.device_unknown,
      title: "Você não possui nenhum dispositivo ativo no momento",
      description:
          "Para visualizar os dados, é necessário que você possua pelo menos um dispositivo conectado a sua rede local.",
      buttonLabel: "Ir para dispositivos",
      onButtonClick: () {
        navigation.navigateToDevicesTab();
      },
    ));
  }
}
