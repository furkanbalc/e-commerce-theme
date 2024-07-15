import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/component/home/vertical_product_card.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/router/route_names.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Image and Check button
          _topImage(),
          SizedBox(height: 40.v),

          /// Horizontal Product List
          _horizontalProductList(),
          SizedBox(height: 22.v),

          /// Horizontal Product List
          _horizontalProductList(),
          SizedBox(height: 22.v),

          /// Bottom Images
          _bottomImages(),
        ],
      ),
    );
  }

  /// Top Image and Check button
  Widget _topImage() {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Image.asset(
          'assets/png/home.png',
          width: 376.h,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Fashion\nsale',
                color: AppColors.whiteTextColor,
                fontSize: 48.fSize,
                fontFamily: 'Metropolis Extra Bold',
                height: 0,
              ),
              SizedBox(height: 18.v),
              SizedBox(
                width: 160.adaptSize,
                child: CustomElevatedButton(
                  onPressed: () {},
                  text: 'Check',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Horizontal Product List
  Widget _horizontalProductList() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Sale',
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                  CustomText(
                    text: 'Super summer sale',
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor,
                  ),
                ],
              ),
              CustomText(
                text: 'View all',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor,
              ),
            ],
          ),
        ),
        SizedBox(height: 22.v),
        SizedBox(
          height: 275.v,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return VerticalProductCard(
                onTap: () {
                  context.goNamed('${AppRouteName.productDetail.name}_home');
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 16.h),
            itemCount: 10,
          ),
        ),
      ],
    );
  }

  /// Bottom Images
  Widget _bottomImages() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.asset(
              'assets/png/new-collection.png',
              width: 375.adaptSize,
              height: 366.adaptSize,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 18.h, 27.v),
              child: CustomText(
                text: 'New Collection',
                fontSize: 34.fSize,
                color: AppColors.whiteTextColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Metropolis Extra Bold',
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: AppColors.backgroundColor,
                  padding: EdgeInsets.only(left: 15.h),
                  width: 187.adaptSize,
                  height: 186.adaptSize,
                  child: CustomText(
                    text: 'Summer Sale',
                    color: AppColors.primaryColor,
                    fontSize: 34.fSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Metropolis Extra Bold',
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      'assets/png/black.png',
                      width: 187.adaptSize,
                      height: 187.adaptSize,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(13.h, 0, 0, 37.v),
                      child: CustomText(
                        text: 'Black',
                        color: AppColors.whiteTextColor,
                        fontSize: 34.fSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Metropolis Extra Bold',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/png/mens-hoodie.png',
                    width: 187.5.adaptSize,
                    height: 374.adaptSize,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
