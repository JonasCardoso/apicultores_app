import 'dart:async';

import 'package:apicultores_app/home/business_logic/bloc/bottom_navigation_bloc.dart';
import 'package:apicultores_app/home/business_logic/entities/bottom_navigation_item_type.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TabGuard extends RouteGuard {
  final BottomNavigationBloc _bottomNavigationBloc;

  TabGuard({required BottomNavigationBloc bottomNavigationBloc})
      : _bottomNavigationBloc = bottomNavigationBloc,
        super(redirectTo: '/');
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    final type = _getTypeByPath(path);
    if (type != null) {
      _bottomNavigationBloc.add(BottomNavigationSelected(type));
    }
    return false;
  }

  BottomNavigationItemType? _getTypeByPath(String path) {
    switch (path) {
      case '/devices':
        return BottomNavigationItemType.devices;
      case '/graphs':
        return BottomNavigationItemType.data;
    }
    return null;
  }
}
