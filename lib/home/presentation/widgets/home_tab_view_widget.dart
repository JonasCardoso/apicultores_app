import 'package:apicultores_app/features/devices/my_devices/presentation/screens/devices_screen.dart';
import 'package:apicultores_app/home/business_logic/entities/bottom_navigation_item_type.dart';
import 'package:apicultores_app/home/presentation/bloc/bottom_navigation_bloc.dart';
import 'package:apicultores_app/shared/strings.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewWidget extends StatelessWidget {
  const HomeTabViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
      switch (state.selectedItem) {
        case BottomNavigationItemType.devices:
          return const DevicesScreen();
        case BottomNavigationItemType.data:
          return const Center(
            child: Text(Strings.bottomNavigationItemData),
          );
        case BottomNavigationItemType.story:
          return const Center(
            child: Text(Strings.bottomNavigationItemStory),
          );
      }
    });
  }
}
