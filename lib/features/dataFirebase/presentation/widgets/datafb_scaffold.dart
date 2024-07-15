import 'package:design_system/design_system.dart';

class DatafbScaffold extends StatelessWidget {
  const DatafbScaffold({super.key, required this.body});
  final Widget body;
  //final String body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBar(
        title: 'Dados Firebase',
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
