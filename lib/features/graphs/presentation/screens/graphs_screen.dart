import 'package:apicultores_app/features/graphs/presentation/navigation/graphs_navigation.dart';
import 'package:apicultores_app/features/graphs/presentation/screens/graphs_bloc_provider.dart';
import 'package:apicultores_app/features/graphs/presentation/screens/graphs_screen_builder.dart';
import 'package:design_system/design_system.dart';

class GraphsScreen extends StatelessWidget {
  const GraphsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const GraphsBlocProvider(
      child: GraphsScreenBuilder(
        navigation: GraphsNavigation(),
      ),
    );
  }
}
