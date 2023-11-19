import 'package:apicultores_app/features/graphs/presentation/widgets/graphs_scaffold.dart';
import 'package:design_system/design_system.dart';

class GraphsFailureScreen extends StatelessWidget {
  const GraphsFailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GraphsScaffold(
      body: FeedBackBanner(
          icon: Icons.error,
          iconColor: SurfaceColor.error,
          title: "Ocorreu um erro ao procurar seus dispositivos",
          description: "Entre na página de dispositivos para tentar novamente",
          buttonLabel: "Ir para dispositivos",
          onButtonClick: () {}),
    );
  }
}
