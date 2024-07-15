import 'package:flutter/material.dart';
import 'package:my_theme/component/categories/sub_category_item.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class SubCategoriesView extends StatefulWidget {
  const SubCategoriesView({super.key});

  @override
  State<SubCategoriesView> createState() => _SubCategoriesViewState();
}

class _SubCategoriesViewState extends State<SubCategoriesView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.v),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// View all items button
          _buildViewAllButton(),
          SizedBox(height: 18.v),

          /// Choose category title
          _chooseCategoryTitle(),
          SizedBox(height: 34.v),

          /// Category list
          Expanded(child: _buildCategoryList()),
        ],
      ),
    );
  }

  /// Choose category title
  CustomText _chooseCategoryTitle() {
    return CustomText(
      text: 'Choose category',
      fontSize: 14.fSize,
      color: AppColors.greyColor,
    );
  }

  /// Category list
  Widget _buildCategoryList() {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return const SubCategoryItem();
      },
      separatorBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 8.v),
        child: const Divider(color: AppColors.greyColor, thickness: .4),
      ),
    );
  }

  /// View all items button
  Widget _buildViewAllButton() {
    return CustomElevatedButton(
      onPressed: () {},
      text: 'VIEW ALL ITEMS',
    );
  }

  /// Appbar
  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      title: 'Categories',
      backgroundColor: Colors.white,
      shadowColor: AppColors.blackColor,
      elevation: 1,
      arrowBack: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.black),
        ),
      ],
    );
  }
}
