import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';
import 'package:my_theme/screens/categories/tabs/category_kids.dart';
import 'package:my_theme/screens/categories/tabs/category_men.dart';
import 'package:my_theme/screens/categories/tabs/category_women.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: _buildAppbar(),
          body: _buildBody(),
        ),
      ),
    );
  }

  /// Appbar
  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      title: 'Categories',
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
      bottom: TabBar(
        splashFactory: NoSplash.splashFactory,
        indicatorColor: AppColors.primaryColor,
        labelPadding: EdgeInsets.zero,
        unselectedLabelColor: AppColors.blackColor,
        labelStyle: TextStyle(fontSize: 16.fSize, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
        tabs: const [
          Tab(text: 'Women'),
          Tab(text: 'Men'),
          Tab(text: 'Kids'),
        ],
        labelColor: AppColors.blackColor,
      ),
    );
  }

  /// Tabbar Views
  Widget _buildBody() {
    return const TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        WomenCategoriesTab(),
        MenCategoriesTab(),
        KidsCategoriesTab(),
      ],
    );
  }
}
