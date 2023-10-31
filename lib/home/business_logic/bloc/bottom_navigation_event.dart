part of 'bottom_navigation_bloc.dart';

@immutable
sealed class BottomNavigationEvent {}

class BottomNavigationSelected extends BottomNavigationEvent {
  final BottomNavigationItemType tab;

  BottomNavigationSelected(this.tab);
}
