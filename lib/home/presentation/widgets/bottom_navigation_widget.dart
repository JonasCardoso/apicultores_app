import 'package:apicultores_app/home/business_logic/bloc/bottom_navigation_bloc.dart';
import 'package:apicultores_app/home/business_logic/entities/bottom_navigation_item_type.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      builder: _buildItems,
    );
  }

  Widget _buildItems(BuildContext context, BottomNavigationState state) {
    return BottomNavigationBar(
      currentIndex: state.items.indexOf(state.selectedItem),
      items: state.items
          .map((item) => BottomNavigationBarItem(
                icon: Icon(item.icon),
                label: item.label,
              ))
          .toList(),
      onTap: (value) {
        _onTapItem(
          context,
          state.items[value],
        );
      },
    );
  }

  void _onTapItem(
    BuildContext context,
    BottomNavigationItemType item,
  ) {
    final bloc = BlocProvider.of<BottomNavigationBloc>(context);
    bloc.add(BottomNavigationSelected(item));
  }
}
