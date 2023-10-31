part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  final BottomNavigationItemType selectedItem;
  final List<BottomNavigationItemType> items;

  const BottomNavigationState({
    required this.selectedItem,
    required this.items,
  });

  @override
  List<Object?> get props => [selectedItem, items];
}
