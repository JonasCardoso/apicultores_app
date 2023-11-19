import 'package:apicultores_app/home/business_logic/bloc/bottom_navigation_bloc.dart';
import 'package:apicultores_app/home/business_logic/bloc/bottom_navigation_bloc_repository.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocProviders extends StatelessWidget {
  const HomeBlocProviders({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<BottomNavigationBloc>(
        create: (context) =>
            BottomNavigationBlocRepository().bottomNavigationBloc,
      )
    ], child: child);
  }
}
