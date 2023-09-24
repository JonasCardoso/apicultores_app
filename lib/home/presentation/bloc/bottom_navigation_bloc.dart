import 'package:apicultores_app/home/business_logic/entities/bottom_navigation_item_type.dart';
import 'package:apicultores_app/home/business_logic/use_case/bottom_navigation_use_case.dart';
import 'package:design_system/design_system.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc(this._useCase)
      : super(
          BottomNavigationState(
            selectedItem: _useCase.currentTab,
            items: _useCase.bottomNavigationItems,
          ),
        ) {
    on<BottomNavigationSelected>(_onTabSelected);
  }

  final BottomNavigationUseCase _useCase;

  void _onTabSelected(
    BottomNavigationSelected event,
    Emitter<BottomNavigationState> emit,
  ) {
    _useCase.selectTab(event.tab);
    emit(
      BottomNavigationState(
        selectedItem: event.tab,
        items: state.items,
      ),
    );
  }
}
