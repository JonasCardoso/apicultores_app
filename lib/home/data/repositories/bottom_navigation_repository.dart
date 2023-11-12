import 'package:apicultores_app/home/business_logic/entities/bottom_navigation_item_type.dart';

class BottomNavigationRepository {
  BottomNavigationItemType _currentTab = BottomNavigationItemType.data;

  BottomNavigationItemType get currentTab => _currentTab;

  void changeTab(BottomNavigationItemType tab) {
    _currentTab = tab;
  }
}
