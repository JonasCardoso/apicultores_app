import 'package:design_system/design_system.dart';

class GraphsScaffold extends StatelessWidget {
  const GraphsScaffold({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar(
        title: 'Dados',
        showBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.large,
        ),
        child: body,
      ),
    );
  }
}
