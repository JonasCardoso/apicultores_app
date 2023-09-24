import 'package:apicultores_app/home/presentation/providers/home_bloc_providers.dart';
import 'package:apicultores_app/home/presentation/widgets/bottom_navigation_widget.dart';
import 'package:apicultores_app/home/presentation/widgets/home_tab_view_widget.dart';
import 'package:design_system/design_system.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeBlocProviders(
      child: SafeArea(
        child: Scaffold(
          body: HomeTabViewWidget(),
          bottomNavigationBar: BottomNavigationWidget(),
        ),
      ),
    );
  }
}
