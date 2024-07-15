import 'package:apicultores_app/home/business_logic/entities/bottom_navigation_item_type.dart';
import 'package:apicultores_app/home/data/repositories/bottom_navigation_repository.dart';

class BottomNavigationUseCase {
  final BottomNavigationRepository _repository;

  BottomNavigationUseCase(this._repository);

  List<BottomNavigationItemType> get bottomNavigationItems => [
        BottomNavigationItemType.devices,
        BottomNavigationItemType.data,
        BottomNavigationItemType.dataFb
      ];

  BottomNavigationItemType get currentTab => _repository.currentTab;

  void selectTab(BottomNavigationItemType tab) {
    _repository.changeTab(tab);
  }
}
