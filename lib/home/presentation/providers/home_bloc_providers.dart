import 'package:apicultores_app/home/business_logic/use_case/bottom_navigation_use_case.dart';
import 'package:apicultores_app/home/data/repositories/bottom_navigation_repository.dart';
import 'package:apicultores_app/home/presentation/bloc/bottom_navigation_bloc.dart';
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
        create: (context) => BottomNavigationBloc(
          BottomNavigationUseCase(
            BottomNavigationRepository(),
          ),
        ),
      )
    ], child: child);
  }
}
