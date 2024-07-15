import 'package:flutter/material.dart';
import 'package:my_theme/bottom/tab_item.dart';
import 'package:my_theme/component/custom_svg_widget.dart';
import 'package:my_theme/constants/assets.dart';

class BottomNavItems {
  static List<NavigationDestination> get views => [
        NavigationDestination(
          selectedIcon: CustomSvgWidget(svg: TabItem.home.filled),
          icon: CustomSvgWidget(svg: TabItem.home.outlined),
          label: TabItem.home.name,
        ),
        NavigationDestination(
          selectedIcon: CustomSvgWidget(svg: TabItem.shop.filled),
          icon: CustomSvgWidget(svg: TabItem.shop.outlined),
          label: TabItem.shop.name,
        ),
        NavigationDestination(
          selectedIcon: CustomSvgWidget(svg: TabItem.bag.filled),
          icon: CustomSvgWidget(svg: TabItem.bag.outlined),
          label: TabItem.bag.name,
        ),
        NavigationDestination(
          selectedIcon: CustomSvgWidget(svg: TabItem.favorites.filled),
          icon: CustomSvgWidget(svg: TabItem.favorites.outlined),
          label: TabItem.favorites.name,
        ),
        NavigationDestination(
          selectedIcon: CustomSvgWidget(svg: TabItem.profile.filled),
          icon: CustomSvgWidget(svg: TabItem.profile.outlined),
          label: TabItem.profile.name,
        ),
      ];
}
