import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/bottom/bottom_nav_items.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/router/route_names.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      surfaceTintColor: Colors.white,
      selectedIndex: _calculateSelectedIndex(context),
      backgroundColor: Colors.white,
      indicatorColor: AppColors.primaryColor.withOpacity(.2),
      onDestinationSelected: (value) => _onItemTapped(context,value),
      destinations: BottomNavItems.views,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(AppRouteName.home.path)) {
      return 0;
    }
    if (location.startsWith(AppRouteName.categories.path)) {
      return 1;
    }
    if (location.startsWith(AppRouteName.bag.path)) {
      return 2;
    }
    if (location.startsWith(AppRouteName.favorites.path)) {
      return 3;
    }
    if (location.startsWith(AppRouteName.profile.path)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(
    BuildContext context,
    int index,
  ) {
    switch (index) {
      case 0:
        context.goNamed(AppRouteName.home.name);
      case 1:
        context.goNamed(AppRouteName.categories.name);
      case 2:
        context.goNamed(AppRouteName.bag.name);
      case 3:
        context.goNamed(AppRouteName.favorites.name);
      case 4:
        context.goNamed(AppRouteName.profile.name);
    }
  }
}
