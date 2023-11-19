import 'package:apicultores_app/home/business_logic/bloc/bottom_navigation_bloc.dart';
import 'package:apicultores_app/home/business_logic/use_case/bottom_navigation_use_case.dart';
import 'package:apicultores_app/home/data/repositories/bottom_navigation_repository.dart';

class BottomNavigationBlocRepository {
  final BottomNavigationBloc bottomNavigationBloc;
  const BottomNavigationBlocRepository._({
    required this.bottomNavigationBloc,
  });
  static BottomNavigationBlocRepository? _instance;
  factory BottomNavigationBlocRepository() {
    _instance ??= BottomNavigationBlocRepository._(
      bottomNavigationBloc: BottomNavigationBloc(
        BottomNavigationUseCase(
          BottomNavigationRepository(),
        ),
      ),
    );
    return _instance!;
  }
}
